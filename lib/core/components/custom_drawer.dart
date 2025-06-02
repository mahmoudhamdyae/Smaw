import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smaw/core/extensions/num_extenstions.dart';
import 'package:smaw/core/resources/assets_manager.dart';
import 'package:smaw/core/resources/colors_manager.dart';

import '../../my_app.dart';
import '../app/app_preferences.dart';
import '../resources/language_manager.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (MediaQuery.paddingOf(context).top + 16).ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // English
            _buildLangItem(
                AssetsManager.eng,
                ColorsManager.primaryBabyBlue, () {
              _saveLanguage(context, english);
            }),
            8.pw,
            // Arabic
            _buildLangItem(
                AssetsManager.ara,
                ColorsManager.primaryWhite, () {
              _saveLanguage(context, arabic);
            }),
            16.pw,
          ],
        )
      ],
    );
  }

  Widget _buildLangItem(String image, Color color, Function() onClick) {
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color
        ),
        child: Image.asset(
          image,
          width: 16,
          height: 16,
        ),
      ),
    );
  }

  Future<void> _saveLanguage(BuildContext context, String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AppPreferences appPref = AppPreferences(prefs);

    // Save the language and update the app locale
    if (language == english && appPref.getAppLanguage() == arabic) {
      appPref.changeAppLanguage();
      MyApp.of(context)?.setLocale(englishLocal);
    } else if (language == arabic && appPref.getAppLanguage() == english) {
      appPref.changeAppLanguage();
      MyApp.of(context)?.setLocale(arabicLocal);
    }
  }
}
