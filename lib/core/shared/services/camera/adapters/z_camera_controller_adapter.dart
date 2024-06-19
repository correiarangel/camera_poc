import 'package:camera/camera.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_camera_controller.dart';

class ZCameraControllerAdapter {
  static ZCameraController toControllerZ(CameraController controller) {
    return ZCameraController(
        controller.description, controller.resolutionPreset);
  }

  static CameraController toController(ZCameraController controller) {
    return CameraController(
        controller.description, controller.resolutionPreset);
  }
}
