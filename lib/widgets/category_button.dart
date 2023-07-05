import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 32),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('Divine Cakes'),
          ),
          const SizedBox(
            width: 16,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('BH_Bakers'),
          ),
          const SizedBox(
            width: 16,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Bakes By Vidhi'),
          ),
          const SizedBox(
            width: 16,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('DM_Bakers'),
          ),
        ],
      ),
    );
  }
}
