import 'package:shared_preferences/shared_preferences.dart';

import '../app/app_preferences.dart';
import 'di.dart';

Future<void> mainModule() async {

  /// SharedPreferences instance
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  /// AppPreferences instance
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance<SharedPreferences>()));
}