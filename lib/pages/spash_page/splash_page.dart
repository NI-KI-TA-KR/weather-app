

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/constants/icons.dart';
import 'package:weather_app/constants/palette.dart';

class SplashPage extends StatelessWidget{
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      color: Palette.lightBlue,
      alignment: Alignment.center,
      child: SvgPicture.asset(AppIcons.clouds, height: 30.h),
    );
  }
}