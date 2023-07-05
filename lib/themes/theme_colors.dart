import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ThemeColors {
  static final colorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.bg,
    secondary: AppColors.secondary,
    onSecondary: AppColors.black,
    background: AppColors.black,
    onBackground: AppColors.bg,
  );
}
