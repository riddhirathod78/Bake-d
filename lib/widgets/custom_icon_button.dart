import 'package:flutter/material.dart';
import 'package:food_craft/constants/app_assets.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      margin: const EdgeInsets.only(
        left: 28,
        right: 28,
        bottom: 22,
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.iconCart,
              width: 24,
            ),
            const SizedBox(
              width: 16,
            ),
            const Text(
              'Add To Cart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
