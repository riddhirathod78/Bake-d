import 'package:flutter/material.dart';
import 'package:food_craft/constants/app_assets.dart';
import 'package:food_craft/models/food_model.dart';

import '../constants/app_colors.dart';
import '../pages/detail_product.dart';
import 'heart_widget.dart';

class ProductItem extends StatelessWidget {
  final FoodModel food;
  const ProductItem({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailProductPage(food: food),
        ),
      ),
      child: Container(
        width: 152,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 12,
            )
          ],
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(4),
                    topLeft: Radius.circular(4),
                  ),
                  child: Image.asset(
                    food.imageUrl,
                    height: 100,
                    width: 168,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: HeartWidget(),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                         /* const Icon(
                            Icons.attach_money,
                            color: AppColors.secondary,
                            size: 20,
                          ),*/
                          Text(
                            food.price.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            AppAssets.iconStar,
                            width: 14,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(food.rating),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
