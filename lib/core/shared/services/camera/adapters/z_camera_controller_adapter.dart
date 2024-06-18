import 'package:camera/camera.dart';
import 'package:camera_poc/core/shared/services/camera/library/camera_controller_zauris.dart';

class ZCameraControllerAdapter {
  static CameraControllerZauris toControllerZauris(
      CameraController controller) {
    return CameraControllerZauris(
        controller.description, controller.resolutionPreset);
  }
    static CameraController toController(
      CameraControllerZauris controller) {
    return CameraController(
        controller.description, controller.resolutionPreset);
  }
}
