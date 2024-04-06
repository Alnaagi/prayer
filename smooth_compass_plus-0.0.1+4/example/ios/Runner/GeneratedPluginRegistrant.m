//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_compass/FlutterCompassPlugin.h>)
#import <flutter_compass/FlutterCompassPlugin.h>
#else
@import flutter_compass;
#endif

#if __has_include(<flutter_sensors/FlutterSensorsPlugin.h>)
#import <flutter_sensors/FlutterSensorsPlugin.h>
#else
@import flutter_sensors;
#endif

#if __has_include(<location/LocationPlugin.h>)
#import <location/LocationPlugin.h>
#else
@import location;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlutterCompassPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterCompassPlugin"]];
  [FlutterSensorsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterSensorsPlugin"]];
  [LocationPlugin registerWithRegistrar:[registry registrarForPlugin:@"LocationPlugin"]];
}

@end
