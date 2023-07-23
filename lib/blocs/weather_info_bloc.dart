import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weather_app/api/weather_info.dart';
import 'package:weather_app/blocs/internet_connection_bloc.dart';
import 'package:weather_app/blocs/location_bloc.dart';
import 'package:weather_app/blocs/setting_bloc.dart';
import 'package:weather_app/constants/enum/weather_type.dart';
import 'package:weather_app/models/weather_info.dart';
import 'package:weather_app/utils/hive_manager.dart';

class WeatherInfoBloc extends BlocBase {
  WeatherInfoBloc({
    required this.settingBloc,
    required this.locationBloc,
    required this.internetConnectionBloc,
  }) {
    settingBloc.addListener(_initWeatherInfoBloc);
    internetConnectionBloc.addListener(_initWeatherInfoBloc);
    _initWeatherInfoBloc();
  }

  final SettingBloc settingBloc;
  final LocationBloc locationBloc;
  final InternetConnectionBloc internetConnectionBloc;

  WeatherType type = WeatherType.daily;

  final _streamWeatherInfoController = BehaviorSubject<List<WeatherInfo>>();
  Stream<List<WeatherInfo>> get weather => _streamWeatherInfoController.stream;

  void _initWeatherInfoBloc() {
    fetchData();
    Stream.periodic(const Duration(minutes: 10)).listen((event) => fetchData());
  }

  changeTypeWeatherInfo(WeatherType weatherType) {
    type = weatherType;
    fetchData();
  }

  fetchData() async {
    await locationBloc.onInitializationComplete;

  
    if (internetConnectionBloc.isConnect) {
      try {
        final weather = await fetchWeatherInfo(
          language: settingBloc.language,
          lat: locationBloc.latLng.lat,
          lng: locationBloc.latLng.lng,
          type: type,
        );
        _streamWeatherInfoController.add(weather);
        await HiveManager.addWeatherInfo(weather, type);
      } catch (_) {
        final result = await HiveManager.getWeatherInfo(type);
        _streamWeatherInfoController.add(result);
      }
    } else {
      final result = await HiveManager.getWeatherInfo(type);
      _streamWeatherInfoController.add(result as List<WeatherInfo>);
    }
  }
}
