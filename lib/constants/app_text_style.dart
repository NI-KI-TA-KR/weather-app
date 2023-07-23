import 'package:flutter/material.dart';
import 'package:weather_app/constants/palette.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle defaultStyle = const TextStyle();

  static TextStyle titleStyle = defaultStyle.copyWith(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    color: Palette.black,
  );

  static TextStyle textStyle = defaultStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: Palette.black,
  );

  static TextStyle greyStyle = defaultStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: Palette.grey,
  );

  static TextStyle temperatureStyle = defaultStyle.copyWith(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: Palette.white.withOpacity(0.5),
  );

  static TextStyle temperatureTitleStyle = temperatureStyle.copyWith(
    fontSize: 60
  );

  static TextStyle textInfoStyle = defaultStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w200,
    color: Palette.white
  );
}
