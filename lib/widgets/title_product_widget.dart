import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../models/food_model.dart';

class TitleProductWidget extends StatelessWidget {
  final FoodModel food;
  const TitleProductWidget({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:14, right:18, left: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            food.name,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            food.seller,
            style: const TextStyle(
              color: AppColors.grey,
            ),
          )
        ],
      ),
    );
  }
}
