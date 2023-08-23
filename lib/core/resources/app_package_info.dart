import 'package:package_info_plus/package_info_plus.dart';

PackageInfo? _packageInfo;

class AppPackageInfo {
  static Future<void> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  static String get getAppName {
    if (_packageInfo != null) {
      return _packageInfo!.appName;
    } else {
      return 'N/A';
    }
  }

  static String get getPackageName {
    if (_packageInfo != null) {
      return _packageInfo!.packageName;
    } else {
      return 'N/A';
    }
  }
}
