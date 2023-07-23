import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/app_text_style.dart';

class DateLocationWidget extends StatelessWidget {
  const DateLocationWidget({
    super.key,
    required this.location,
    required this.dateTime,
    required this.locale,
  });

  final String location;
  final DateTime dateTime;
  final String locale;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            location,
            style: AppTextStyle.titleStyle,
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            DateFormat('EEEE, d MMMM', locale).format(dateTime),
            style: AppTextStyle.greyStyle,
          ),
        ),
      ],
    );
  }
}
