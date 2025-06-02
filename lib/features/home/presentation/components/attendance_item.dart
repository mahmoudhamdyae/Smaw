import 'package:flutter/material.dart';
import 'package:smaw/core/extensions/num_extenstions.dart';
import 'package:smaw/core/resources/colors_manager.dart';
import 'package:smaw/core/resources/fonts_manager.dart';
import 'package:smaw/features/home/domain/models/attendance.dart';

class AttendanceItem extends StatelessWidget {

  final Attendance attendance;
  const AttendanceItem({super.key, required this.attendance});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 2,
          color: ColorsManager.supportBlueDeep
        )
      ),
      child: Column(
        children: [
          Text(
            attendance.dayNo.toString(),
            style: FontsManager.heading4Bold(),
          ),
          4.ph,
          Text(attendance.dateM.toString()),
          8.ph,
          Text(attendance.dateH.toString()),
          Text(attendance.enter.toString()),
          Text(attendance.exit.toString()),
        ],
      ),
    );
  }
}
