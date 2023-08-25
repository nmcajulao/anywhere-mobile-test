import 'dart:async';
import 'package:anywhere_mobile_test/injection_container.dart';
import 'package:flutter/material.dart';
import 'app.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(const App());
}
