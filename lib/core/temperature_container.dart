import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/constants/app_text_style.dart';
import 'package:weather_app/constants/palette.dart';

class TemperatureContainer extends StatelessWidget {
  const TemperatureContainer({super.key, required this.temperature});

  final double temperature;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 40.w,
      height: 10.h,
      decoration: BoxDecoration(
        color: Palette.lightBlue,
        borderRadius: BorderRadius.circular(3.w),
      ),
      child: Text(
        '${temperature.round()}°',
        style: AppTextStyle.temperatureStyle,
      ),
    );
  }
}
