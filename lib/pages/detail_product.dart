import 'package:flutter/material.dart';
import 'package:food_craft/models/food_model.dart';

import '../constants/app_colors.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/description_widget.dart';
import '../widgets/divider_widget.dart';
import 'package:food_craft/widgets/image_banner.dart';
import '../widgets/info_product.dart';
import '../widgets/price_widget.dart';
import '../widgets/title_product_widget.dart';
import '../widgets/total_item_widget.dart';


class DetailProductPage extends StatelessWidget {
  final FoodModel food;
  const DetailProductPage({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.transparent,
        shadowColor: Colors.transparent,
        title: Center(child: Text('Detail ${food.name}')),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageBanner(imageUrl: food.imageUrl),
            const DividerWidget(),
            TitleProductWidget(food: food),
            InfoProduct(food: food),
            DescriptionWidget(
              text: food.desc,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, bottom: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PriceWidget(
                    price: food.price,
                  ),
                  const TotalItemWidget(),
                ],
              ),
            ),
            const CustomIconButton(),
          ],
        ),
      ),
    );
  }
}
