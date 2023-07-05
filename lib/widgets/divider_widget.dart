import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 26, bottom: 42),
        height: 4,
        width: 70,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
