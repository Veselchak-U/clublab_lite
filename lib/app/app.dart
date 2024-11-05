import 'dart:ui';

import 'package:clublab_lite/app/l10n/gen/app_localizations.dart';
import 'package:clublab_lite/app/l10n/l10n.dart';
import 'package:clublab_lite/app/navigation/app_navigation.dart';
import 'package:clublab_lite/app/style/app_theme.dart';
import 'package:clublab_lite/common/overlays/app_overlays.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatefulWidget {
  final Locale? savedLocale;

  const App(
    this.savedLocale, {
    super.key,
  });

  static void setLocale(BuildContext context, Locale value) {
    final appState = context.findAncestorStateOfType<_AppState>();
    appState?.setLocale(value);
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final _locale = ValueNotifier<Locale>(const Locale('en'));

  @override
  void initState() {
    super.initState();
    _initLocale();
  }

  void _initLocale() {
    // Try to get saved Locale
    final savedLocale = widget.savedLocale;
    if (savedLocale != null) {
      setLocale(savedLocale);

      return;
    }

    // Try to get device Locale
    final deviceLocale = PlatformDispatcher.instance.locale;
    final supportedLocale = AppLocalizations.supportedLocales
        .firstWhereOrNull((e) => e.languageCode == deviceLocale.languageCode);
    if (supportedLocale != null) {
      setLocale(supportedLocale);
    }
  }

  @override
  void dispose() {
    _locale.dispose();
    super.dispose();
  }

  void setLocale(Locale value) {
    _locale.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return child ?? const SizedBox.shrink();
      },
      child: ValueListenableBuilder(
        valueListenable: _locale,
        builder: (context, locale, _) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppNavigation.router,
            locale: locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: AppTheme.light,
            scaffoldMessengerKey: _scaffoldMessengerKey,
            builder: (context, child) {
              l10n = context.l10n;
              l10nLocale = locale;

              AppOverlays.init(
                scaffoldMessengerKey: _scaffoldMessengerKey,
                theme: AppTheme.light,
              );

              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: TextScaler.noScaling,
                ),
                child: child ?? const SizedBox.shrink(),
              );
            },
          );
        },
      ),
    );
  }
}