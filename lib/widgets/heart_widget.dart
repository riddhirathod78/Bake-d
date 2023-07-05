import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class HeartWidget extends StatefulWidget {
  const HeartWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<HeartWidget> createState() => _HeartWidgetState();
}

bool isTap = false;

class _HeartWidgetState extends State<HeartWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        isTap = !isTap;
      }),
      child: isTap
          ? const Icon(
              Icons.favorite,
              shadows: [Shadow(
                color: Colors.black,
                offset: Offset(1, 2),
              )],
              color: AppColors.error,
            )
          : const Icon(
              Icons.favorite_border,
              color: AppColors.grey,
            ),
    );
  }
}
