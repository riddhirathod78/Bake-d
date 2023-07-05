import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class BrandLogo extends StatelessWidget {
  const BrandLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              text: '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: AppColors.primary,
              ),
              children: [
                TextSpan(
                  text: 'BAKE`D',
                  style: TextStyle(
                    color: AppColors.primary,
                  ),
                )
              ],
            ),
          ),
          const Text(
            'A Ready-To-Eat Slice 😋 Of Heaven 😇.',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.grey,
            ),
          )
        ],
      ),
    );
  }
}
