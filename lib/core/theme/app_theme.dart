import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musium/core/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  static final theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: const AppBarThemeData(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: AppColors.transparent,
    )
  );
}