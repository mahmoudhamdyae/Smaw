import 'package:flutter/material.dart';

import 'core/di/di.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();

  runApp(const MyApp());
}
