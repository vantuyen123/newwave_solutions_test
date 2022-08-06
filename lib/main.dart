import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newwave_solutions_test/presentations/my_app.dart';
import 'di/component/locator.dart' as getit;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setPreferredOrientations();
  await getit.locator();
  runApp(const MyApp());
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}