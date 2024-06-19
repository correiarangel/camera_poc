import 'package:camera/camera.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_xfile.dart';

class ZXFileAdapter {
  static ZXFile toZXFile(XFile file) {
    return ZXFile(file.path);
  }
}
