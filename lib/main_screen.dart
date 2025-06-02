import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:smaw/core/components/custom_drawer.dart';
import 'package:smaw/core/extensions/num_extenstions.dart';
import 'package:smaw/core/resources/colors_manager.dart';
import 'package:smaw/core/resources/language_manager.dart';
import 'package:smaw/features/home/presentation/screens/home_screen.dart';
import 'package:smaw/features/orders/presentation/screens/orders_screen.dart';

import 'core/resources/assets_manager.dart';
import 'core/resources/fonts_manager.dart';
import 'core/resources/strings_manager.dart';
import 'features/attendance/presentation/screens/attendance_screen.dart';

class MainScreen extends StatefulWidget {

  final int initialIndex;
  const MainScreen({super.key, this.initialIndex = 0});

  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }

}
class MainScreenState extends State<MainScreen> {

  final _advancedDrawerController = AdvancedDrawerController();
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    OrdersScreen(),
    Container(),
    AttendanceScreen(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      drawer: const CustomDrawer(),
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [ColorsManager.primaryBlue, ColorsManager.primaryBlue],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
        child: Scaffold(
          body: _pages[_currentIndex],
          floatingActionButton: FloatingActionButton(
            backgroundColor: ColorsManager.primaryBlue,
            shape: CircleBorder(),
            elevation: 4,
            onPressed: () {
              setState(() {
                _currentIndex = 2;
              });
            },
            child: Icon(Icons.add, color: ColorsManager.primaryWhite),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 8,
            color: Colors.white,
            elevation: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (MediaQuery.sizeOf(context).width * .04).pw,
                    _buildHome(context, _currentIndex == 0),
                    (MediaQuery.sizeOf(context).width * .1).pw,
                    _buildOrders(context, _currentIndex == 1),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildAttendance(context, _currentIndex == 3),
                    (MediaQuery.sizeOf(context).width * .1).pw,
                    _buildMenu(context, _currentIndex == 4),
                    (MediaQuery.sizeOf(context).width * .04).pw,
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }

  Widget _buildHome(BuildContext context, bool isActive) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = 0;
        });
      },
      child: _buildItem(
          iconSelected: AssetsManager.homeSelected,
          iconNotSelected: AssetsManager.home,
          name: StringsManager.navBarHome,
          isActive: isActive
      ),
    );
  }

  Widget _buildOrders(BuildContext context, bool isActive) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = 1;
        });
      },
      child: _buildItem(
          iconSelected: AssetsManager.ordersSelected,
          iconNotSelected: AssetsManager.orders,
          name: StringsManager.navBarOrders,
          isActive: isActive
      ),
    );
  }

  Widget _buildAttendance(BuildContext context, bool isActive) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = 3;
        });
      },
      child: _buildItem(
          iconSelected: AssetsManager.attendanceSelected,
          iconNotSelected: AssetsManager.attendance,
          name: StringsManager.navBarAttendance,
          isActive: isActive
      ),
    );
  }

  Widget _buildMenu(BuildContext context, bool isActive) {
    return InkWell(
      onTap: () {
        setState(() {
          _advancedDrawerController.showDrawer();
        });
      },
      child: _buildItem(
          iconSelected: AssetsManager.menuSelected,
          iconNotSelected: AssetsManager.menu,
          name: StringsManager.navBarMenu,
          isActive: isActive
      ),
    );
  }

  Widget _buildItem({
    required String iconSelected,
    required String iconNotSelected,
    required String name,
    bool isActive = true,
  }) {
    return Column(
      children: [
        _getWidget(
            isActive ? iconSelected : iconNotSelected,
            name.trans(context),
            isActive: isActive
        )
      ],
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
          color: isActive ? ColorsManager.primaryBlue : ColorsManager.gray700,
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