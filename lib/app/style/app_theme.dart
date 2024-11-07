import 'package:clublab_lite/app/style/app_colors.dart';
import 'package:clublab_lite/app/style/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.primaryWhite,
      secondary: AppColors.primary,
      onSecondary: AppColors.primaryWhite,
      error: AppColors.red,
      onError: AppColors.white,
      surface: AppColors.background,
      onSurface: AppColors.text,
    ),
    primaryColor: AppColors.primary,
    // appBarTheme: _appBarThemeLight,
    navigationBarTheme: _navigationBarThemeLight,
    textButtonTheme: _textButtonThemeLight,
    dividerTheme: _dividerThemeLight,
    textSelectionTheme: _textSelectionThemeLight,
  );

  static const systemOverlayStyleLight = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  // static final _appBarThemeLight = AppBarTheme(
  //   backgroundColor: AppColors.primary,
  //   iconTheme: const IconThemeData(color: AppColors.white),
  //   titleTextStyle: AppTextStyles.s14w500.copyWith(
  //     color: AppColors.primaryWhite,
  //   ),
  // );

  static const _navigationBarThemeLight = NavigationBarThemeData(
    backgroundColor: Colors.white,
  );

  static final _textButtonThemeLight = TextButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.all(
        AppTextStyles.s16w400,
      ),
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.disabled) ? AppColors.disabled : AppColors.text,
      ),
      padding: WidgetStateProperty.all(EdgeInsets.zero),
    ),
  );

  static const _dividerThemeLight = DividerThemeData(
    color: AppColors.grey,
    space: 1,
  );

  static final _textSelectionThemeLight = TextSelectionThemeData(
    cursorColor: AppColors.primary,
    selectionHandleColor: AppColors.primary,
    selectionColor: AppColors.primary.withOpacity(0.3),
  );
}
