import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smaw/core/extensions/num_extenstions.dart';
import 'package:smaw/core/resources/assets_manager.dart';
import 'package:smaw/core/resources/colors_manager.dart';
import 'package:smaw/core/resources/fonts_manager.dart';
import 'package:smaw/core/resources/strings_manager.dart';

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
        // Languages
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
        ),
        16.ph,
        // User Image
        ClipOval(
          child: Image.asset(
            AssetsManager.avatar2,
            width: 120,
            height: 120,
          ),
        ),
        8.ph,
        // User Name
        Text(
          'وليد سليمان',
          style: FontsManager.heading3Bold(
            color: ColorsManager.primaryWhite
          ),
        ),
        4.ph,
        // User Email
        Text(
          'barmg3@gmail.com',
          style: FontsManager.footnoteMedium(
              color: ColorsManager.primaryWhite.withValues(alpha: .8)
          ),
        ),
        4.ph,
        //
        Text(
          '#2288932',
          style: FontsManager.footnoteMedium(
              color: ColorsManager.primaryWhite.withValues(alpha: .8)
          ),
        ),
        24.ph,
        _buildItem(context, StringsManager.drawerOrders, AssetsManager.ordersFill, () {}),
        32.ph,
        _buildItem(context, StringsManager.drawerAttendance, AssetsManager.attendanceFill, () {}),
        32.ph,
        _buildItem(context, StringsManager.drawerSummary, AssetsManager.summary, () {}),
        32.ph,
        _buildDivider(context),
        32.ph,
        _buildItem(context, StringsManager.drawerAbout, AssetsManager.about, () {}),
        32.ph,
        _buildItem(context, StringsManager.drawerCond, AssetsManager.policy, () {}),
        32.ph,
        _buildItem(context, StringsManager.drawerPolicy, AssetsManager.policy, () {}),
        32.ph,
        _buildDivider(context),
        32.ph,
        _buildItem(context, StringsManager.drawerLogOut, AssetsManager.logOut, () {}),
        32.ph,
      ],
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Container(
      height: 1,
      width: MediaQuery.sizeOf(context).width / 2,
      color: ColorsManager.primaryWhite.withValues(alpha: .4),
    );
  }

  Widget _buildItem(
      BuildContext context,
      String title,
      String image,
      Function() onClick
      ) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 27),
        child: Row(
          children: [
            Image.asset(
              image,
              width: 16,
              height: 16,
            ),
            8.pw,
            Text(
              title.trans(context),
              style: FontsManager.heading5Bold(
                color: ColorsManager.primaryWhite
              ),
            )
          ],
        ),
      ),
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
