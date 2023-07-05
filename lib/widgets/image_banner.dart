import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ImageBanner extends StatelessWidget {
  final String imageUrl;
  const ImageBanner({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(imageUrl),
        Container(
          width: double.infinity,
          height: 410,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primary,
                AppColors.primary.withOpacity(0),
              ],
            ),
          ),
        )
      ],
    );
  }
}
