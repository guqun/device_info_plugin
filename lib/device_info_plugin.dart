import 'dart:async';

import 'package:flutter/services.dart';

class DTPlaformInfoPlugin {
  static const MethodChannel _channel = const MethodChannel('dt_platform_info_plugin');
  static const MethodChannel _storage_directory_channel = const MethodChannel('dt_storage_directory_plugin');
  
  
  static Future<Map<dynamic, dynamic>> get dtPlaformInfoPlugin async {
    final Map<dynamic, dynamic> info = await _channel.invokeMethod('getDTPlatformInfo');
    return info;
  }

  static Future<String> get dtStorageDirectoryPlugin async {
    final String info = await _channel.invokeMethod('getDTStorageDirectory');
    return info;
  }
}
