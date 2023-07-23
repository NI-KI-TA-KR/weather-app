import 'package:hive/hive.dart';
import 'package:weather_app/constants/enum/weather_type.dart';

part 'weather_info.g.dart';

@HiveType(typeId: 2)
class WeatherInfo {
  @HiveField(0)
  final DateTime time;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String icon;

  @HiveField(3)
  final double? temperature;

  @HiveField(4)
  final double? min;

  @HiveField(5)
  final double? max;

  @HiveField(6)
  final int clouds;

  @HiveField(7)
  final int humidity;

  WeatherInfo({
    required this.time,
    required this.description,
    required this.icon,
    required this.temperature,
    required this.min,
    required this.max,
    required this.clouds,
    required this.humidity
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json, WeatherType type) {
    return WeatherInfo(
      time: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      temperature: type == WeatherType.hourly ? double.parse(json['temp'].toString()) : null,
      min: type == WeatherType.daily ? double.parse(json['temp']['min'].toString()) : null,
      max: type == WeatherType.daily ? double.parse(json['temp']['max'].toString()) : null,
      clouds: json['clouds'] ?? 0,
      humidity: json['humidity']
    );
  }
}
