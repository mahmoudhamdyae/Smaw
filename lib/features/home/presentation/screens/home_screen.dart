import 'package:flutter/material.dart';
import 'package:smaw/core/extensions/num_extenstions.dart';
import 'package:smaw/core/resources/strings_manager.dart';
import 'package:smaw/features/home/domain/models/attendance.dart';
import 'package:smaw/features/home/domain/models/order.dart';
import 'package:smaw/features/home/presentation/components/attendance_list.dart';
import 'package:smaw/features/home/presentation/components/home_main_label.dart';
import 'package:smaw/features/home/presentation/components/home_top_bar.dart';
import 'package:smaw/features/home/presentation/components/order_list.dart';
import 'package:smaw/features/home/presentation/components/user_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (MediaQuery.paddingOf(context).top + 11).ph,
        const HomeTopBar(),
        13.ph,
        Expanded(
          child: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              13.ph,
              UserCard(),
              24.ph,
              HomeMainLabel(title: StringsManager.homeSummary),
              8.ph,
              AttendanceList(attendances: getFakeAttendanceList()),
              24.ph,
              HomeMainLabel(
                title: StringsManager.homeNewestOrders,
                sub: StringsManager.homeViewMore,
              ),
              8.ph,
              OrderList(orders: getFakeOrders())
            ],
          ),
        )
      ],
    );
  }
}
