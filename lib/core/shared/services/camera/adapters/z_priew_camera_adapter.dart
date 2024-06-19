import 'package:camera/camera.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_preview_camera.dart';

class ZPriewCameraAdapter {
  static ZPreviewCamera toCameraZ(CameraPreview priew) {
    return ZPreviewCamera(priew.controller);
  }
}
