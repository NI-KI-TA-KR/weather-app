import 'package:dio/dio.dart';
import 'package:weather_app/constants/api.dart';
import 'package:weather_app/constants/enum/language.dart';
import 'package:weather_app/constants/enum/weather_type.dart';
import 'package:weather_app/models/weather_info.dart';

Future<List<WeatherInfo>> fetchWeatherInfo({required Language language, required double lat, required double lng, required WeatherType type}) async {
  final response = await Dio().get(
    domainV3,
    queryParameters: {
      'lat' : lat,
      'lon' : lng,
      'appid' : apiKey,
      'lang' : language.toSymbols(),
      'units' : 'metric',
      'exclude': type.exlude,
    },
  );
  
  return _getWeathersInfoListFromJson(response.data, type);
}

List<WeatherInfo> _getWeathersInfoListFromJson(Map<String, dynamic> json, WeatherType type){

  final List<dynamic> list = json[type.toStr()];
  return list.map((element) => WeatherInfo.fromJson(element, type)).toList();
}
