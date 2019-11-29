import 'dart:async';

import 'package:flutter/services.dart';

class DTPlaformInfoPlugin {
  static const MethodChannel _channel = const MethodChannel('dt_platform_info_plugin');

  static Future<Map<dynamic, dynamic>> get dtPlaformInfoPlugin async {
    final Map<dynamic, dynamic> info = await _channel.invokeMethod('getDTPlatformInfo');
    return info;
  }
}
