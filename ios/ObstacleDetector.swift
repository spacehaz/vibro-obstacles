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

  private var engine: CHHapticEngine?
  
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

  @objc
  func vibrate (_ intensity: NSNumber) -> Void {
    
    guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
      print("Not supported")
      return
    }
    
    do {
      if engine == nil {
        engine = try? CHHapticEngine()
        try engine?.start()
      }
      
      let intensityParam = CHHapticEventParameter(
        parameterID: .hapticIntensity, value: intensity.floatValue
      )
      
      let sharpnessParam = CHHapticEventParameter(
        parameterID: .hapticSharpness, value: 0.5
      )
      
      let event = CHHapticEvent(
        eventType: .hapticContinuous, parameters: [intensityParam, sharpnessParam], relativeTime: 0.0, duration: 3.0
      )
      
      let pattern = try CHHapticPattern(events: [event], parameters: [])
      
      let player = try engine?.makePlayer(with: pattern)
      
      try player?.start(atTime: CHHapticTimeImmediate)
    } catch {
      print("Some error occured")
      return
    }
    
    
    
    
    
  }
  
}
