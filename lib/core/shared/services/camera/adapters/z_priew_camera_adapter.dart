
import 'package:camera/camera.dart';
import 'package:camera_poc/core/shared/services/camera/library/priew_camera_zauris.dart';

class ZPriewCameraAdapter {
 static PriewCameraZauris  convet(CameraPreview priew) {
    return PriewCameraZauris(priew.controller);
  }
}
