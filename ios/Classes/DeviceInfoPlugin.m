#import "DeviceInfoPlugin.h"
#import <device_info_plugin/device_info_plugin-Swift.h>

@implementation DeviceInfoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDeviceInfoPlugin registerWithRegistrar:registrar];
}
@end
