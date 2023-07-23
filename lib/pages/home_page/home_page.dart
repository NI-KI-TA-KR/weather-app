import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/blocs/current_weather_bloc.dart';
import 'package:weather_app/blocs/setting_bloc.dart';
import 'package:weather_app/blocs/weather_info_bloc.dart';
import 'package:weather_app/constants/enum/language.dart';
import 'package:weather_app/core/date_location.dart';
import 'package:weather_app/core/temperature_container.dart';
import 'package:weather_app/core/weather_app_bar.dart';
import 'package:weather_app/core/weather_container.dart';
import 'package:weather_app/core/weather_list.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/weather_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.getBloc<CurrentWeatherBloc>();
    final weatherInfoBloc = BlocProvider.getBloc<WeatherInfoBloc>();
    final settingBloc = BlocProvider.getBloc<SettingBloc>();

    return Scaffold(
      appBar: const WeatherAppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: 100.w,
          margin: EdgeInsets.all(5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder<Weather>(
                stream: weatherBloc.weather,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final weather = snapshot.data!;
                    return Column(
                      children: [
                        DateLocationWidget(
                          location: weather.locality,
                          dateTime: weather.time,
                          locale: settingBloc.language.toSymbols(),
                        ),
                        WeatherContainer(
                          icon: weather.icon,
                          temperature: weather.temperature,
                          description: weather.description,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TemperatureContainer(
                                temperature: weather.minTemperature,
                              ),
                              TemperatureContainer(
                                temperature: weather.maxTemperature,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              StreamBuilder<List<WeatherInfo>>(
                stream: weatherInfoBloc.weather,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final weather = snapshot.data!;
                    return WeatherList(
                      weatherInfo: weather,
                      type: weatherInfoBloc.type,
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
