import 'package:flutter/material.dart';
import 'package:smaw/core/resources/assets_manager.dart';
import 'package:smaw/core/resources/colors_manager.dart';
import 'package:smaw/core/resources/fonts_manager.dart';
import 'package:smaw/core/resources/sizes_manager.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MarginsManager.mainHorizontalMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'SMAW',
            style: FontsManager.heading3Bold(
              color: ColorsManager.primaryBlue
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigate to Notifications Screen
            },
            child: Image.asset(
              AssetsManager.bell,
              height: 24,
              width: 24,
            ),
          )
        ],
      ),
    );
  }
}
