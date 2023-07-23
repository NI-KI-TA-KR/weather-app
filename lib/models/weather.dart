import 'package:hive/hive.dart';

part 'weather.g.dart';

@HiveType(typeId: 1)
class Weather {
  Weather({
    required this.lat,
    required this.lon,
    required this.description,
    required this.icon,
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.locality,
    required this.time,
  });

  @HiveField(0)
  final double lat;
  
  @HiveField(1)
  final double lon;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String icon;

  @HiveField(4)
  final double temperature;

  @HiveField(5)
  final double minTemperature;

  @HiveField(6)
  final double maxTemperature;

  @HiveField(7)
  final String locality;

  @HiveField(8)
  final DateTime time;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      lat: json['coord']['lat'],
      lon: json['coord']['lon'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      temperature: json['main']['temp'],
      minTemperature: json['main']['temp_min'],
      maxTemperature: json['main']['temp_max'],
      locality: json['name'],
      time: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: true),
    );
  }
}
