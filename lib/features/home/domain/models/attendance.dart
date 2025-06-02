import 'package:flutter/cupertino.dart';
import 'package:smaw/core/resources/language_manager.dart';
import 'package:smaw/core/resources/strings_manager.dart';

class Attendance {
  final int? dayNo;
  final String? dateM;
  final String? dateH;
  final String? enter;
  final String? exit;
  final bool? isVacancy;
  final bool? isAbsence;
  final bool? willBeDeducted;

  const Attendance({
    this.dayNo,
    this.dateM,
    this.dateH,
    this.enter,
    this.exit,
    this.isVacancy,
    this.isAbsence,
    this.willBeDeducted
  });
}

String convertDay(BuildContext context, int day) {
  switch (day) {
    case 1:
      return StringsManager.sat.trans(context);
    case 2:
      return StringsManager.sun.trans(context);
    case 3:
      return StringsManager.mon.trans(context);
    case 4:
      return StringsManager.tue.trans(context);
    case 5:
      return StringsManager.wed.trans(context);
    case 6:
      return StringsManager.thu.trans(context);
    case 7:
      return StringsManager.fri.trans(context);
    default:
      return '';
  }
}

List<Attendance> getFakeAttendanceList() => [
  const Attendance(
    dayNo: 2,
    dateM: '12/05/2025',
    dateH: '12/12/1446',
    enter: '09:00',
    exit: '17:00',
    isVacancy: false,
    isAbsence: false,
    willBeDeducted: false
  ),
  const Attendance(
      dayNo: 3,
      dateM: '12/05/2025',
      dateH: '12/12/1446',
      enter: '12:00',
      exit: '17:00',
      isVacancy: false,
      isAbsence: false,
      willBeDeducted: true
  ),
  const Attendance(
      dayNo: 4,
      dateM: '12/05/2025',
      dateH: '12/12/1446',
      isVacancy: true,
      isAbsence: false,
      willBeDeducted: false
  ),
  const Attendance(
      dayNo: 5,
      dateM: '12/05/2025',
      dateH: '12/12/1446',
      isVacancy: false,
      isAbsence: true,
      willBeDeducted: true
  ),
  const Attendance(
      dayNo: 6,
      dateM: '12/05/2025',
      dateH: '12/12/1446',
      enter: '09:00',
      exit: '17:00',
      isVacancy: false,
      isAbsence: false,
      willBeDeducted: false
  ),
];