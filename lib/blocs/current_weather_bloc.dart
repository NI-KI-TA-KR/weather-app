import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:weather_app/api/current_weather.dart';
import 'package:weather_app/blocs/internet_connection_bloc.dart';
import 'package:weather_app/blocs/location_bloc.dart';
import 'package:weather_app/blocs/setting_bloc.dart';
import 'package:weather_app/models/weather.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weather_app/utils/hive_manager.dart';

class CurrentWeatherBloc extends BlocBase {
  CurrentWeatherBloc({
    required this.settingBloc,
    required this.locationBloc,
    required this.internetConnectionBloc,
  }) {
    settingBloc.addListener(_initCurrentWeatherBloc);
    internetConnectionBloc.addListener(_initCurrentWeatherBloc);
    _initCurrentWeatherBloc();
  }

  final SettingBloc settingBloc;
  final LocationBloc locationBloc;
  final InternetConnectionBloc internetConnectionBloc;

  final _streamCurrentWeatherController = BehaviorSubject<Weather>();
  Stream<Weather> get weather => _streamCurrentWeatherController.stream;

  void _initCurrentWeatherBloc() {
    _fetchData();
    Stream.periodic(const Duration(minutes: 10)).listen((event) => _fetchData);
  }

  _fetchData() async {
    await locationBloc.onInitializationComplete;
    if (internetConnectionBloc.isConnect) {
      try {
        final weather = await fetchCurrentWeather(
          language: settingBloc.language,
          lat: locationBloc.latLng.lat,
          lng: locationBloc.latLng.lng,
        );
        _streamCurrentWeatherController.add(weather);
        await HiveManager.addWeather(weather);
      } catch (_) {
        final result = await HiveManager.getWeather();
        if (result != null) {
          _streamCurrentWeatherController.add(result);
        }
      }
    } else {
      final result = await HiveManager.getWeather();
      if (result != null) {
        _streamCurrentWeatherController.add(result);
      }
    }
  }
}
