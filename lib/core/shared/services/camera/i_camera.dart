import 'package:camera_poc/core/shared/services/camera/library/z_camera_controller.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_flash_mode.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_xfile.dart';

abstract class ICamera {
  Future<ZCameraController> initialize();
  Future<ZXFile?> takePicture();
  void dispose();
  Future<void> setFlashMode(ZFlashMode mode);
  ZCameraController? get cameraController;
}
