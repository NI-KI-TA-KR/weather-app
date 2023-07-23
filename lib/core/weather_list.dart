import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_text_style.dart';
import 'package:weather_app/constants/enum/weather_type.dart';
import 'package:weather_app/core/weather_daily_widget.dart';
import 'package:weather_app/core/weather_hourly_widget.dart';
import 'package:weather_app/models/weather_info.dart';

class WeatherList extends StatelessWidget {
  const WeatherList({
    super.key,
    required this.weatherInfo,
    required this.type,
  });

  final List<WeatherInfo> weatherInfo;
  final WeatherType type;

  @override
  Widget build(BuildContext context) {
    
    if (weatherInfo.isEmpty) {
      return Center(
        child: Text(
          "No connection",
          style: AppTextStyle.greyStyle,
        ),
      );
    }

    return Column(
      children: [
        ...weatherInfo.map((info) {
          if (type == WeatherType.daily) {
            return WeatherDailyWidget(info: info);
          } else {
            return WeatherHourlyWidget(info: info);
          }
        }).toList()
      ],
    );
  }
}
