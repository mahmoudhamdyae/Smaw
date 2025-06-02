import 'package:flutter/material.dart';
import 'package:smaw/core/extensions/num_extenstions.dart';
import 'package:smaw/core/resources/assets_manager.dart';
import 'package:smaw/core/resources/colors_manager.dart';
import 'package:smaw/core/resources/fonts_manager.dart';
import 'package:smaw/core/resources/language_manager.dart';
import 'package:smaw/core/resources/strings_manager.dart';
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
          color: attendance.willBeDeducted == true ? ColorsManager.supportOrange : attendance.isVacancy == true ? ColorsManager.gray200 : ColorsManager.supportBlueDeep
        )
      ),
      child: Column(
        children: [
          Text(
            convertDay(context, attendance.dayNo ?? 0),
            style: FontsManager.heading4Bold(),
          ),
          4.ph,
          Text(attendance.dateM.toString()),
          8.ph,
          Text(attendance.dateH.toString()),
          8.ph,
          attendance.enter != null ? _buildEnterExitWidget(attendance.enter!)
              :
          Container(),
          (attendance.enter != null ? 8 : 0).ph,
          attendance.exit != null ?
          _buildEnterExitWidget(attendance.exit!, isEnter: false)
              :
          Container(),
          attendance.isVacancy == true ?
          _buildAbsenceVacancyWidget(context, StringsManager.homeVacation)
              :
              attendance.isAbsence == true ?
                  _buildAbsenceVacancyWidget(context, StringsManager.homeAbsence)
                  :
                  Container()
        ],
      ),
    );
  }

  Widget _buildEnterExitWidget(String title, {bool isEnter = true}) => Container(
    decoration: BoxDecoration(
      color: ColorsManager.gray100,
      borderRadius: BorderRadius.circular(30),
    ),
    padding: const EdgeInsets.all(8),
    child: Row(
      children: [
        Image.asset(
          isEnter ? AssetsManager.enter : AssetsManager.exit,
          width: 16,
          height: 16,
        ),
        2.pw,
        Text(
          title,
          style: FontsManager.heading5Bold(),
        ),
      ],
    ),
  );

  Widget _buildAbsenceVacancyWidget(BuildContext context, String title) => Container(
    decoration: BoxDecoration(
      color: ColorsManager.gray100,
      borderRadius: BorderRadius.circular(18),
    ),
    padding: const EdgeInsets.symmetric(vertical: 29, horizontal: 27),
    child: Text(
      title.trans(context),
      style: FontsManager.heading5Bold(),
    ),
  );
}
