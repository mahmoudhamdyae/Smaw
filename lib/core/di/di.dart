import 'package:get_it/get_it.dart';

import 'main_module.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  await mainModule();
}