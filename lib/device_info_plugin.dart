import 'dart:async';

import 'package:flutter/services.dart';

class DeviceInfoPlugin {
  static const MethodChannel _channel = const MethodChannel('device_info_plugin');

  static Future<Map<dynamic, dynamic>> get platformVersion async {
    final Map<dynamic, dynamic> info = await _channel.invokeMethod('getPlatformInfo');
    return info;
  }
}
