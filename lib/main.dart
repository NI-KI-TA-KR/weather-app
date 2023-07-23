import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/blocs/current_weather_bloc.dart';
import 'package:weather_app/blocs/internet_connection_bloc.dart';
import 'package:weather_app/blocs/location_bloc.dart';
import 'package:weather_app/blocs/setting_bloc.dart';
import 'package:weather_app/blocs/weather_info_bloc.dart';
import 'package:weather_app/core/splash_loading.dart';
import 'package:weather_app/utils/hive.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await Hive.initFlutter();
  registerAdapters();
  initializeDateFormatting();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (
        BuildContext context,
        Orientation orientation,
        DeviceType deviceType,
      ) {
        return BlocProvider(
          blocs: [
            Bloc((i) => SettingBloc()),
            Bloc((i) => LocationBloc()),
            Bloc((i) => InternetConnectionBloc()),
            Bloc(
              (i) => CurrentWeatherBloc(
                settingBloc: BlocProvider.getBloc<SettingBloc>(),
                locationBloc: BlocProvider.getBloc<LocationBloc>(),
                internetConnectionBloc: BlocProvider.getBloc<InternetConnectionBloc>(),
              ),
            ),
            Bloc(
              (i) => WeatherInfoBloc(
                settingBloc: BlocProvider.getBloc<SettingBloc>(),
                locationBloc: BlocProvider.getBloc<LocationBloc>(),
                internetConnectionBloc: BlocProvider.getBloc<InternetConnectionBloc>(),
              ),
            ),
          ],
          dependencies: const [],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weather App',
            home: SplashLoading(),
          ),
        );
      },
    );
  }
}
