import 'package:dio/dio.dart';
import 'package:weather_app/constants/api.dart';
import 'package:weather_app/constants/enum/language.dart';
import 'package:weather_app/models/weather.dart';

Future<Weather> fetchCurrentWeather({required Language language, required double lat, required double lng}) async {
  final response = await Dio().get(
    domainV2_5,
    queryParameters: {
      'lat' : lat,
      'lon' : lng,
      'appid' : apiKey,
      'lang' : language.toSymbols(),
      'units' : 'metric',
    },
  );
  
  return Weather.fromJson(response.data);
}
