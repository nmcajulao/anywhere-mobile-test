import 'package:anywhere_mobile_test/core/resources/device_type.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class AppFunctions {
  /// * Check whether the app is running on a tablet or a phone.
  static Future<DeviceType> getDeviceType(
      {required BuildContext context}) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Theme.of(context).platform == TargetPlatform.iOS) {
      // * iOS has direct info to extract whether the user is on table or phone.
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      if (iosInfo.model.contains('iPad')) {
        return DeviceType.tablet;
      } else {
        return DeviceType.phone;
      }
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      // * this is the simplest implementation i could find to determin the device for Android.
      var shortestSide = MediaQuery.of(context).size.shortestSide;
      var useMobileLayout = shortestSide < 600;

      if (!useMobileLayout) {
        return DeviceType.tablet;
      } else {
        return DeviceType.phone;
      }
    }
    return DeviceType.unknown;
  }
}
