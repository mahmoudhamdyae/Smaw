import 'package:flutter/material.dart';
import 'package:smaw/core/extensions/num_extenstions.dart';
import 'package:smaw/core/resources/sizes_manager.dart';
import 'package:smaw/features/home/domain/models/attendance.dart';
import 'package:smaw/features/home/presentation/components/attendance_item.dart';

class AttendanceList extends StatelessWidget {

  final List<Attendance> attendances;
  const AttendanceList({super.key, required this.attendances});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: MarginsManager.mainHorizontalMargin),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: attendances.length,
        separatorBuilder: (BuildContext context, int index) => 4.pw,
        itemBuilder: (BuildContext context, int index) {
          return AttendanceItem(attendance: attendances[index]);
        },
      ),
    );
  }
}
