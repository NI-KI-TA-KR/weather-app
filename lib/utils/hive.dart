import 'package:hive_flutter/adapters.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/weather_info.dart';

void registerAdapters(){
  Hive.registerAdapter(WeatherInfoAdapter());
  Hive.registerAdapter(WeatherAdapter());
}