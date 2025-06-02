import 'package:flutter/material.dart';
import 'package:smaw/core/extensions/num_extenstions.dart';
import 'package:smaw/core/resources/colors_manager.dart';
import 'package:smaw/core/resources/fonts_manager.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/sizes_manager.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: MarginsManager.mainHorizontalMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorsManager.primaryBlue
      ),
      child: Row(
        spacing: 8,
        children: [
          // User Image
          ClipOval(
            child: Image.asset(
              AssetsManager.avatar1,
              height: 79,
              width: 79,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              Row(
                spacing: 8,
                children: [
                  Text(
                    'وليد سليمان',
                    style: FontsManager.heading3Bold(
                        color: ColorsManager.primaryWhite
                    ),
                  ),
                  Text(
                    '#223956',
                    style: FontsManager.heading5(
                      color: ColorsManager.primaryWhite.withValues(alpha: .8)
                    ),
                  )
                ],
              ),
              4.ph,
              // Email
              Text(
                'barmg3@gmail.com',
                style: FontsManager.heading5Bold(
                  color: ColorsManager.primaryWhite
                ),
              ),
              8.ph,
              // Balance
              Row(
                spacing: 4,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      '15,000',
                      style: FontsManager.heading2Bold(
                        color: ColorsManager.primaryWhite
                      ),
                    ),
                  ),
                  Image.asset(
                    AssetsManager.sar,
                    width: 24,
                    height: 24,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
