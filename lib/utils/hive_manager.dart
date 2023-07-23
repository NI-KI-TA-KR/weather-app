import 'package:hive/hive.dart';
import 'package:weather_app/constants/enum/weather_type.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/weather_info.dart';

class HiveManager {
  HiveManager._();

  static addWeather(Weather weather) async {
    late Box box;
    if (Hive.isBoxOpen("weather")) {
      box = Hive.box('weather');
    }
    box = await Hive.openBox<Weather>('weather');
    if (box.isNotEmpty) await box.clear();
    await box.add(weather);
  }

  static Future<Weather?> getWeather() async {
    try {
      late Box box;
      if (Hive.isBoxOpen("weather")) {
        box = Hive.box('weather');
      }
      box = await Hive.openBox<Weather>('weather');
      final result = box.values.first;
      return result;
    } catch (_) {
      return null;
    }
  }

  static addWeatherInfo(List<WeatherInfo> weatherInfo, WeatherType type) async {
    late Box box;
    if (Hive.isBoxOpen("'weather_info${type.toStr()}'")) {
      box = Hive.box('weather_info${type.toStr()}');
    }
    box = await Hive.openBox<List<WeatherInfo>>('weather_info${type.toStr()}');
    if (box.isNotEmpty) await box.clear();
    await box.put('weatherInfo${type.toStr()}', weatherInfo);
  }

  static Future<dynamic> getWeatherInfo(WeatherType type) async {
    try {
      late Box box;
      if (Hive.isBoxOpen("'weather_info${type.toStr()}'")) {
        box = Hive.box('weather_info${type.toStr()}');
      }
      box = await Hive.openBox('weather_info${type.toStr()}');
      final List<dynamic> result = box.get('weatherInfo${type.toStr()}') ?? [];

      return result.map((e) => e as WeatherInfo).toList();
    } catch (_) {
      return [];
    }
  }
}
