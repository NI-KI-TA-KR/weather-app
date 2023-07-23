import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/blocs/internet_connection_bloc.dart';
import 'package:weather_app/constants/app_text_style.dart';
import 'package:weather_app/constants/palette.dart';
import 'package:weather_app/utils/image.dart';

class WeatherContainer extends StatelessWidget {
  const WeatherContainer({
    super.key,
    required this.icon,
    required this.temperature,
    required this.description,
  });

  final String icon;
  final double temperature;
  final String description;

  @override
  Widget build(BuildContext context) {
    final internetConnectionBloc = BlocProvider.getBloc<InternetConnectionBloc>();

    return Container(
      margin: EdgeInsets.only(top: 5.h, bottom: 2.h),
      padding: EdgeInsets.all(3.w),
      height: 24.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: Palette.lightBlue,
        borderRadius: BorderRadius.circular(3.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${temperature.round()}°",
                style: AppTextStyle.temperatureTitleStyle,
              ),
              if (internetConnectionBloc.isConnect)
                Image.network(getImageForWeather(icon)),
            ],
          ),
          Text(
            description,
            style: AppTextStyle.greyStyle.copyWith(color: Palette.white),
          ),
        ],
      ),
    );
  }
}
