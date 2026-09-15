//
//  ObstacleDetector.swift
//  vibro
//
//  Created by Hazo Baykulov on 15.09.2026.
//

import Foundation
import CoreHaptics

@objc(ObstacleDetector)
class ObstacleDetector: NSObject {
  
  @objc
  func isLidarSupported () -> NSNumber {
    return false
  }
  
  @objc
  func startObstacleDetection () -> Void {
    print("Stared")
  }
  
  @objc
  func stopObstacleDetection () -> Void {
    print("Stopped")
  }
  
  @objc
  func checkHapticsCapability(_ resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
    let supportsHaptics = CHHapticEngine.capabilitiesForHardware().supportsHaptics
    resolve(supportsHaptics)
  }
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return false
  }
  
}
