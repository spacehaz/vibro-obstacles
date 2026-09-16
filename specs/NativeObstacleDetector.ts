import type { TurboModule } from "react-native";
import { TurboModuleRegistry } from "react-native";

export interface Spec extends TurboModule {
  isLidarSupported(): boolean
  startObstacleDetection(): void;
  stopObstacleDetection(): void;
  checkHapticsCapability(): Promise<boolean>;
  vibrate(intensity: number): void
}

export default TurboModuleRegistry.getEnforcing<Spec>("ObstacleDetector")