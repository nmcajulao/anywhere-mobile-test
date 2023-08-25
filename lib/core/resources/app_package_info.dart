import 'package:package_info_plus/package_info_plus.dart';

PackageInfo? _packageInfo;

class AppPackageInfo {
  /// * initializes app package info
  static Future<void> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  /// * extracts app name from package info and returns it
  static String get getAppName {
    if (_packageInfo != null) {
      return _packageInfo!.appName;
    } else {
      return 'N/A';
    }
  }

  /// * extracts package name from package info and returns it
  static String get getPackageName {
    if (_packageInfo != null) {
      return _packageInfo!.packageName;
    } else {
      return 'N/A';
    }
  }
}
