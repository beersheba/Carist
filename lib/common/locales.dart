import 'dart:ui';

const localeUs = Locale('en', 'US');
const localeIl = Locale('he', 'IL');

enum Language { hebrew, english }

extension LanguageName on Language {
  String get name {
    switch (this) {
      case Language.english:
        return 'English';
      case Language.hebrew:
        return 'עברית';
      default:
        return '';
    }
  }
}
