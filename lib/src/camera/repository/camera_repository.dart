import 'package:camera_poc/core/shared/services/camera/library/z_camera_controller.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_camera_exceptiom.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_flash_mode.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_xfile.dart';
import 'package:camera_poc/core/shared/services/camera/i_camera.dart';

abstract class IRepositoryCamera {
  Future<ZCameraController> initialize();
  Future<ZXFile?> takePicture();
  Future<void> setFlash(ZFlashMode mode);
  void dispose();
  // CameraController? get cameraController;
}

class RepositoryCamera implements IRepositoryCamera {
  final ICamera _cameraService;

  RepositoryCamera(this._cameraService);

  @override
  Future<ZCameraController> initialize() async {
    try {
      return await _cameraService.initialize();
    } on IZCameraException catch (err) {
      throw ZCameraException(err.code, err.description);
    }
  }

  @override
  Future<ZXFile?> takePicture() async {
    try {
      return await _cameraService.takePicture();
    } on IZCameraException catch (err) {
      throw ZCameraException(err.code, err.description);
    }
  }

  @override
  void dispose() {
    _cameraService.dispose();
  }

  @override
  Future<void> setFlash(ZFlashMode mode) async {
    try {
      await _cameraService.setFlashMode(mode);
    } on IZCameraException catch (err) {
      throw ZCameraException(err.code, err.description);
    }
  }
}
