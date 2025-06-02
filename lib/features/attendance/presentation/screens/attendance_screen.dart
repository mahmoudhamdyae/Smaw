import 'package:flutter/material.dart';
import 'package:smaw/core/resources/fonts_manager.dart';
import 'package:smaw/core/resources/language_manager.dart';
import 'package:smaw/core/resources/strings_manager.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          StringsManager.navBarAttendance.trans(context),
          style: FontsManager.heading5(),
        ),
      ),
    );
  }
}
