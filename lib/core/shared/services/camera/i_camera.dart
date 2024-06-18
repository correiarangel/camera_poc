import 'package:camera_poc/core/shared/services/camera/library/camera_controller_zauris.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_flash_mode.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_xfile.dart';

abstract class ICamera {
  Future<CameraControllerZauris> initialize();
  Future<ZXFile?> takePicture();
  void dispose();
  Future<void> setFlashMode(ZFlashMode mode);
  CameraControllerZauris? get cameraController;
}
