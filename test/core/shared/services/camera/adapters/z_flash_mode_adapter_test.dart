import 'package:camera_poc/core/shared/services/camera/adapters/z_flash_mode_adapter.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:camera/camera.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_flash_mode.dart';

void main() {
  group('ZFlashModeAdapter', () {
    test('toFlashMode should convert ZFlashMode.off to FlashMode.off', () {
      final result = ZFlashModeAdapter.toFlashMode(ZFlashMode.off);
      expect(result, equals(FlashMode.off));
    });

    test('toFlashMode should convert ZFlashMode.always to FlashMode.always', () {
      final result = ZFlashModeAdapter.toFlashMode(ZFlashMode.always);
      expect(result, equals(FlashMode.always));
    });

    test('toFlashMode should convert ZFlashMode.auto to FlashMode.auto', () {
      final result = ZFlashModeAdapter.toFlashMode(ZFlashMode.auto);
      expect(result, equals(FlashMode.auto));
    });

    test('toFlashMode should convert ZFlashMode.torch to FlashMode.torch', () {
      final result = ZFlashModeAdapter.toFlashMode(ZFlashMode.torch);
      expect(result, equals(FlashMode.torch));
    });

    test('toFlashMode should return FlashMode.off for an unrecognized mode', () {
      final result = ZFlashModeAdapter.toFlashMode(ZFlashMode.values.firstWhere((mode) => mode.toString() == 'ZFlashMode.unrecognized', orElse: () => ZFlashMode.off));
      expect(result, equals(FlashMode.off));
    });
  });
}
