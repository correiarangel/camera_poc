import 'package:camera/camera.dart';

abstract class IZCameraException extends CameraException{
  IZCameraException(super.code, super.description);
}

class ZCameraException extends IZCameraException{
  ZCameraException(super.code, super.description);
}
