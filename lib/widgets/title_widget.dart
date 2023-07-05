import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final bool isSeeAll;

  const TitleWidget({
    Key? key,
    required this.title,
    this.isSeeAll = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28, right: 28, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          isSeeAll
              ? const Text(
                  'See All',
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontSize: 13,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
