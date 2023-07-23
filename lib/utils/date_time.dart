import 'package:intl/intl.dart';

String checkDayToday(DateTime dateTime, String locale, String today){
  final now = DateTime.now();

  if(dateTime.day == now.day && dateTime.month == now.month && dateTime.year == now.year){
    return today;
  }

  return DateFormat('EEEE', locale).format(dateTime);
}