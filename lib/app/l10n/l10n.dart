import 'package:clublab_lite/app/app.dart';
import 'package:clublab_lite/app/l10n/gen/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

// Global variables for getting localized strings without context
AppLocalizations? l10n;
Locale? l10nLocale;

extension AppLocalizationsExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  Locale get locale => Localizations.localeOf(this);

  set locale(Locale value) {
    App.setLocale(this, value);
  }
}

extension LocaleExt on Locale {
  bool get isRtl => _currentDirection == TextDirection.RTL;

  bool get isLtr => _currentDirection == TextDirection.LTR;

  TextDirection get _currentDirection =>
      Bidi.isRtlLanguage(languageCode) ? TextDirection.RTL : TextDirection.LTR;
}

class LanguageNamedLocale {
  final Locale locale;

  LanguageNamedLocale(this.locale);

  @override
  String toString() {
    return switch (locale.languageCode.toLowerCase()) {
      'en' => 'English',
      'he' => 'עברית',
      _ => locale.languageCode,
    };
  }
}
