import 'package:flutter/material.dart';
import 'package:food_craft/constants/app_assets.dart';

class TotalItemWidget extends StatefulWidget {
  const TotalItemWidget({Key? key}) : super(key: key);

  @override
  State<TotalItemWidget> createState() => _TotalItemWidgetState();
}

int total = 0;

class _TotalItemWidgetState extends State<TotalItemWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 104,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => setState(() {
              if (total != 0) {
                total--;
              }
            }),
            child: Image.asset(
              AppAssets.iconMinus,
              width: 14,
            ),
          ),
          Text(
            total.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          GestureDetector(
            onTap: () => setState(() {
              total++;
            }),
            child: Image.asset(
              AppAssets.iconPlus,
              width: 14,
            ),
          ),
        ],
      ),
    );
  }
}
