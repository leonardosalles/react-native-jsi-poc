#import <React/RCTBridge+Private.h>
#import "NativeMath.h"

using namespace facebook;

namespace rnjsi {
  void installNativeMath(jsi::Runtime &runtime);
}

@interface NativeMathInstaller : NSObject
@end

@implementation NativeMathInstaller

+ (void)install:(RCTBridge *)bridge {
  if (!bridge || !bridge.runtime) {
    NSLog(@"JS runtime not available yet");
    return;
  }

  auto &runtime = *(facebook::jsi::Runtime *)bridge.runtime;
  rnjsi::installNativeMath(runtime);
  NSLog(@"NativeMath installed via JSI on iOS");
}

@end
