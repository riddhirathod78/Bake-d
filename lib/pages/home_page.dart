import 'package:flutter/material.dart';

import '../data/k_test_food.dart';
import '../widgets/brand_logo.dart';
import '../widgets/category_button.dart';
import '../widgets/product_item.dart';
import '../widgets/promo_banner.dart';
import '../widgets/search_widget.dart';
import '../widgets/title_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var foods = kTestFood;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const BrandLogo(),
            const SearchWidget(),
            const CategoryButton(),
            const TitleWidget(
              title: 'BAKED',
            ),
            const PromoBanner(),
            const TitleWidget(title: 'Delicious'),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, bottom: 10),
              child: Wrap(
                spacing: 50,
                runSpacing: 40,
                children: [
                  for (int i = 0; i < foods.length; i++)
                    ProductItem(
                      food: foods[i],
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
