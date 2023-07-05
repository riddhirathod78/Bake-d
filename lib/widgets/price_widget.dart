import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants/app_colors.dart';

class PriceWidget extends StatelessWidget {
  final double price;
  const PriceWidget({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          NumberFormat.simpleCurrency(locale: 'hi-IN',decimalDigits: 2).format(price),
          style: TextStyle(
            color: AppColors.grey,
          ),
        ),

      ],
    );
  }
}
