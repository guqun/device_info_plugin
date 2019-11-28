package com.dogtogether.device_info_plugin;

import android.os.Build;
import android.util.ArrayMap;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;


public class DeviceInfoPlugin implements MethodChannel.MethodCallHandler {

    public static void registerWith(PluginRegistry.Registrar registrar) {
      MethodChannel channel = new MethodChannel(registrar.messenger(), "device_info_plugin");
      channel.setMethodCallHandler(new DeviceInfoPlugin());
    }

  @Override
  public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
    if (methodCall.method.equals("getPlatformInfo")) {
      result.success(getDeviceInfo());
    } else {
      result.notImplemented();
    }
  }

  private Map<String, String> getDeviceInfo()
  {
    Map<String, String> maps = new ArrayMap<>();
    maps.put("MODEL", Build.MODEL);
    maps.put("VERSION_RELEASE", Build.VERSION.RELEASE);
    return maps;
  }
}
