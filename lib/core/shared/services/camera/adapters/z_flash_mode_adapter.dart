import 'package:camera/camera.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_flash_mode.dart';

class ZFlashModeAdapter {
  static FlashMode toFlashMode(ZFlashMode mode) {
    if (mode == ZFlashMode.off) return FlashMode.off;
    if (mode == ZFlashMode.always) return FlashMode.always;
    if (mode == ZFlashMode.auto) return FlashMode.auto;
    if (mode == ZFlashMode.torch) return FlashMode.torch;
    if (mode == ZFlashMode.always) return FlashMode.always;
    return FlashMode.off;
  }
}
