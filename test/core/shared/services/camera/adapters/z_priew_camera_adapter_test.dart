import 'package:camera/camera.dart';
import 'package:camera_poc/core/shared/services/camera/adapters/z_priew_camera_adapter.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_preview_camera.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCameraController extends Mock implements CameraController {}

void main() {
  setUpAll(() {
    registerFallbackValue(MockCameraController());
  });

  group('ZPriewCameraAdapter', () {
    test('toCameraZ should convert CameraPreview to PriewCameraZ', () {
      final mockCameraController = MockCameraController();
      final cameraPreview = CameraPreview(mockCameraController);

      final result = ZPriewCameraAdapter.toCameraZ(cameraPreview);

      expect(result, isA<ZPreviewCamera>());
      expect(result.controller, equals(mockCameraController));
    });
  });
}
