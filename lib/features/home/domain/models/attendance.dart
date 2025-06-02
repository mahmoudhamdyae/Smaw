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

// String convert

List<Attendance> getFakeAttendanceList() => [
  Attendance(
    dayNo: 2,
    dateM: '12/05/2025',
    dateH: '12/12/1446',
    enter: '09:00',
    exit: '17:00',
    isVacancy: false,
    isAbsence: false,
    willBeDeducted: false
  ),
  Attendance(
      dayNo: 3,
      dateM: '12/05/2025',
      dateH: '12/12/1446',
      enter: '12:00',
      exit: '17:00',
      isVacancy: false,
      isAbsence: false,
      willBeDeducted: true
  ),
  Attendance(
      dayNo: 4,
      dateM: '12/05/2025',
      dateH: '12/12/1446',
      enter: '09:00',
      exit: '17:00',
      isVacancy: true,
      isAbsence: false,
      willBeDeducted: false
  ),
  Attendance(
      dayNo: 5,
      dateM: '12/05/2025',
      dateH: '12/12/1446',
      enter: '09:00',
      exit: '17:00',
      isVacancy: false,
      isAbsence: true,
      willBeDeducted: true
  ),
  Attendance(
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