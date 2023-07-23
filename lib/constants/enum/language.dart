enum Language { english, russian }

extension LanguageToType on Language {
  String toSymbols() {
    switch (this) {
      case Language.english:
        return 'en';
      case Language.russian:
        return 'ru';
    }
  }

  String toStr() {
    switch (this) {
      case Language.english:
        return 'english';
      case Language.russian:
        return 'russian';
    }
  }
}

extension StringLanguage on String {
  Language toLanguage() {
    switch (this) {
      case 'ru':
        return Language.russian;
      default:
        return Language.english;
    }
  }
}
