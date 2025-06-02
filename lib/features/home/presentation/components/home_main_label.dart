import 'package:flutter/material.dart';
import 'package:smaw/core/resources/colors_manager.dart';
import 'package:smaw/core/resources/fonts_manager.dart';
import 'package:smaw/core/resources/language_manager.dart';
import 'package:smaw/core/resources/sizes_manager.dart';

class HomeMainLabel extends StatelessWidget {

  final String title;
  final String? sub;

  const HomeMainLabel({
    super.key,
    required this.title,
    this.sub
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MarginsManager.mainHorizontalMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title.trans(context),
            style: FontsManager.heading4Bold(
              color: ColorsManager.primaryBlack
            ),
          ),
          sub != null ? InkWell(
            onTap: () {
              // Navigate to View More Screen
            },
            child: Text(
              sub!.trans(context),
              style: FontsManager.heading4Bold(
                color: ColorsManager.primaryBlue
              ),
            ),
          ) : Container(),
        ],
      ),
    );
  }
}
