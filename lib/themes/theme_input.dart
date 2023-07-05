import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ThemeInput {
  static const inputDecoration = InputDecorationTheme(
    contentPadding: EdgeInsets.all(12),
    border: OutlineInputBorder(),
    fillColor: AppColors.white,
    filled: true,
    hintStyle: TextStyle(
      fontSize: 14,
      color: AppColors.grey,
    ),
    iconColor: AppColors.grey,
  );
}
