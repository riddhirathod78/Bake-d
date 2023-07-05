import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../models/food_model.dart';
import 'text_icon_widget.dart';

class InfoProduct extends StatelessWidget {
  final FoodModel food;
  const InfoProduct({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left:4, right:6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextIconWidget(
            text: '${food.rating}/5',
            icon: AppAssets.iconStar,
          ),
          TextIconWidget(
            text: '${food.location}Km',
            icon: AppAssets.iconLocation,
          ),
          TextIconWidget(
            text: '${food.time}min',
            icon: AppAssets.iconTime,
          ),
          TextIconWidget(text: '${food.time}kg', icon:AppAssets.iconKg)
        ],
      ),
    );
  }
}
