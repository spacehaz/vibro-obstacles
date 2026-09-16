//
//  ObstacleDetector.m
//  vibro
//
//  Created by Hazo Baykulov on 15.09.2026.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(ObstacleDetector, NSObject)

RCT_EXTERN_METHOD(isLidarSupported)
RCT_EXTERN_METHOD(startObstacleDetection)
RCT_EXTERN_METHOD(stopObstacleDetection)
RCT_EXTERN_METHOD(checkHapticsCapability:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(vibrate:(nonnull NSNumber *)intensity)

@end
