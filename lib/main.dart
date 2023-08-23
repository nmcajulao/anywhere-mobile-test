import 'dart:async';
import 'package:anywhere_mobile_test/core/resources/app_package_info.dart';
import 'package:anywhere_mobile_test/injection_container.dart';
import 'package:flutter/material.dart';
import 'app.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPackageInfo.init();
  initializeDependencies();
  runApp(const App());
}
