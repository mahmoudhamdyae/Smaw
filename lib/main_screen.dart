import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:smaw/core/extensions/num_extenstions.dart';
import 'package:smaw/core/resources/colors_manager.dart';
import 'package:smaw/core/resources/language_manager.dart';
import 'package:smaw/features/home/presentation/screens/home_screen.dart';

import 'core/resources/assets_manager.dart';
import 'core/resources/fonts_manager.dart';
import 'core/resources/strings_manager.dart';

class MainScreen extends StatefulWidget {

  final int initialIndex;
  const MainScreen({super.key, this.initialIndex = 0});

  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }

}
class MainScreenState extends State<MainScreen> {

  late final PersistentTabController _controller;

  MainScreenState();
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      tabs: [
        _buildHome(context),
        _buildOrders(context),
        _buildAdd(context),
        _buildAttendance(context),
        _buildMenu(context),
      ],
      navBarBuilder: (navBarConfig) => Style13BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
            padding: EdgeInsets.only(top: 10),
            color: ColorsManager.primaryWhite,
            boxShadow: [
              BoxShadow(
                color: Color(0xFF64707A).withValues(alpha: 0.1),
                spreadRadius: 5,
                blurRadius: 20,
                offset: const Offset(0, 0),
              )
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            // boxShadow: navBarShadow(context: context)
        ),
      ),
    );
  }

  PersistentTabConfig _buildHome(BuildContext context) {
    return _buildItem(
        iconSelected: AssetsManager.homeSelected,
        iconNotSelected: AssetsManager.home,
        name: StringsManager.navBarHome
    );
  }

  PersistentTabConfig _buildOrders(BuildContext context) {
    return _buildItem(
        iconSelected: AssetsManager.ordersSelected,
        iconNotSelected: AssetsManager.orders,
        name: StringsManager.navBarOrders
    );
  }

  PersistentTabConfig _buildAdd(BuildContext context) {
    return PersistentTabConfig(
      screen: const HomeScreen(),
      item: ItemConfig(
        icon: Icon(Icons.add, color: ColorsManager.primaryWhite,),
        inactiveIcon: Icon(Icons.add, color: ColorsManager.primaryWhite,),
      ),
    );
  }

  PersistentTabConfig _buildAttendance(BuildContext context) {
    return _buildItem(
        iconSelected: AssetsManager.attendanceSelected,
        iconNotSelected: AssetsManager.attendance,
        name: StringsManager.navBarAttendance
    );
  }

  PersistentTabConfig _buildMenu(BuildContext context) {
    return _buildItem(
        iconSelected: AssetsManager.menuSelected,
        iconNotSelected: AssetsManager.menu,
        name: StringsManager.navBarMenu
    );
  }

  PersistentTabConfig _buildItem({
    required String iconSelected,
    required String iconNotSelected,
    required String name
  }) {
    return PersistentTabConfig(
      screen: const HomeScreen(),
      item: ItemConfig(
        icon: _getWidget(
            iconSelected,
            name.trans(context)
        ),
        inactiveIcon: _getWidget(
            iconNotSelected,
            name.trans(context),
            isActive: false
        ),
      ),
    );
  }

  Widget _getWidget(String image, String text, {bool isActive = true}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 24,
          width: 24,
          color: isActive ? ColorsManager.primaryBlue : ColorsManager.gray500,
        ),
        8.ph,
        Text(
          text,
          style: isActive ?_getActiveTextStyle() : _getInActiveTextStyle(),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  TextStyle _getInActiveTextStyle() {
    return FontsManager.captionSBold(
      color: ColorsManager.gray500
    );
  }

  TextStyle _getActiveTextStyle() {
    return FontsManager.captionSBold(
        color: ColorsManager.primaryBlue
    );
  }
}