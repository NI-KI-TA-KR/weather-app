import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/blocs/internet_connection_bloc.dart';
import 'package:weather_app/blocs/setting_bloc.dart';
import 'package:weather_app/constants/app_text_style.dart';
import 'package:weather_app/constants/enum/language.dart';
import 'package:weather_app/constants/icons.dart';
import 'package:weather_app/constants/palette.dart';
import 'package:weather_app/models/weather_info.dart';
import 'package:weather_app/utils/date_time.dart';
import 'package:weather_app/utils/image.dart';

class WeatherDailyWidget extends StatefulWidget {
  const WeatherDailyWidget({super.key, required this.info});

  final WeatherInfo info;

  @override
  State<WeatherDailyWidget> createState() => _WeatherDailyWidgetState();
}

class _WeatherDailyWidgetState extends State<WeatherDailyWidget> {
  bool isShowDetailInfo = false;
  @override
  Widget build(BuildContext context) {
    final settingBloc = BlocProvider.getBloc<SettingBloc>();
    final internetConnectionBloc =
        BlocProvider.getBloc<InternetConnectionBloc>();

    return GestureDetector(
      onTap: () {
        setState(() {
          isShowDetailInfo = !isShowDetailInfo;
        });
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 1.h, bottom: 1.h),
            height: 8.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Palette.darkBlue,
              borderRadius: BorderRadius.circular(3.w),
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 2.w, right: 2.w),
                  width: 24.w,
                  child: Text(
                    checkDayToday(
                      widget.info.time,
                      settingBloc.language.toSymbols(),
                      settingBloc.today,
                    ),
                    style: AppTextStyle.textInfoStyle.copyWith(fontSize: 15),
                  ),
                ),
                if (internetConnectionBloc.isConnect)
                  Container(
                    margin: EdgeInsets.only(right: 5.w),
                    child: Image.network(getImageForWeather(widget.info.icon)),
                  ),
                Container(
                  margin: EdgeInsets.only(right: 5.w),
                  child: Text(
                    "min ${widget.info.min!.round()}°",
                    style: AppTextStyle.textInfoStyle,
                  ),
                ),
                Text(
                  "max ${widget.info.max!.round()}°",
                  style: AppTextStyle.textInfoStyle,
                ),
              ],
            ),
          ),
          if (isShowDetailInfo)
            AnimatedContainer(
              margin: EdgeInsets.only(bottom: 2.h),
              duration: const Duration(milliseconds: 300),
              height: isShowDetailInfo ? 8.h : 0,
              decoration: BoxDecoration(
                color: Palette.darkBlue,
                borderRadius: BorderRadius.circular(3.w),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.clouds, height: 5.h),
                      SizedBox(width: 2.w),
                      Text(
                        "${widget.info.clouds.toString()}%",
                        style: AppTextStyle.textInfoStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.humidity, height: 5.h),
                      SizedBox(width: 2.w),
                      Text(
                        "${widget.info.humidity.toString()}%",
                        style: AppTextStyle.textInfoStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
