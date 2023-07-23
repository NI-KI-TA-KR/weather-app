import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:weather_app/constants/enum/language.dart';
import 'dart:ui' as ui;

class SettingBloc extends BlocBase{
  SettingBloc(){
    fetchlanguage();
  }

  late Language language;


  fetchlanguage(){
    final deviceLocale = ui.window.locale;
    language = deviceLocale.languageCode.toLanguage();
    notifyListeners();
  }

  changeLanguage(Language language){
    this.language = language;
    notifyListeners();
  }

  String get today{
    switch (language) {
      case Language.english:
        return "Today";
      case Language.russian:
        return "cегодня";
    }
  }
}