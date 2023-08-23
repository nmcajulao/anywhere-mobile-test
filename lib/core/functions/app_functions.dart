import 'package:anywhere_mobile_test/core/resources/device_type.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class AppFunctions {
  /// * Check whether the app is running on a tablet or a phone.
  static Future<DeviceType> getDeviceType(
      {required BuildContext context}) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      if (iosInfo.model.contains('iPad')) {
        return DeviceType.tablet;
      } else {
        return DeviceType.phone;
      }
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;
      double screenDensity = MediaQuery.of(context).devicePixelRatio;
      DeviceType deviceType = DeviceType.unknown;

      // A simple rule to determine tablet based on screen size and density
      if (screenWidth > 600 && screenDensity > 2.0) {
        deviceType = DeviceType.tablet;
      } else {
        deviceType = DeviceType.phone;
      }

      return deviceType;
    }
    return DeviceType.unknown;
  }
}
