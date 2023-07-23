import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/blocs/setting_bloc.dart';
import 'package:weather_app/blocs/weather_info_bloc.dart';
import 'package:weather_app/constants/app_text_style.dart';
import 'package:weather_app/constants/enum/language.dart';
import 'package:weather_app/constants/enum/weather_type.dart';
import 'package:weather_app/constants/palette.dart';

class WeatherAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WeatherAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherInfoBloc = BlocProvider.getBloc<WeatherInfoBloc>();
    final settingBloc = BlocProvider.getBloc<SettingBloc>();

    return AppBar(
      backgroundColor: Palette.white,
      elevation: 0,
      title: Container(
        alignment: Alignment.center,
        height: 10.w,
        width: 10.w,
        decoration: BoxDecoration(
          color: Palette.lightBlue,
          borderRadius: BorderRadius.circular(2.w),
        ),
        child: Text(
          'N',
          style: AppTextStyle.defaultStyle,
        ),
      ),
      actions: [
        PopupMenuButton<Language>(
          icon:  const Icon(Icons.language, color: Palette.lightBlue),
          onSelected: (Language value) => settingBloc.changeLanguage(value),
          itemBuilder: (BuildContext context) {
            return [Language.english, Language.russian].map((Language option) {
              return PopupMenuItem<Language>(
                value: option,
                child: Text(option.toStr()),
              );
            }).toList();
          },
        ),
        PopupMenuButton<WeatherType>(
          icon:  const Icon(Icons.settings, color: Palette.lightBlue),
          onSelected: (WeatherType value) => weatherInfoBloc.changeTypeWeatherInfo(value),
          itemBuilder: (BuildContext context) {
            return [WeatherType.daily, WeatherType.hourly].map((WeatherType option) {
              return PopupMenuItem<WeatherType>(
                value: option,
                child: Text(option.toStr()),
              );
            }).toList();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(8.h);
}
