import 'package:camera/camera.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_flash_mode.dart';

import 'package:camera_poc/core/shared/services/camera/camera_service.dart';

import '../../../../fake_camera_value.dart';
import '../../../../src/camera/page/camera_page_test.mocks.dart';

void main() {
  late MockICamera cameraService;
  late MockZCameraController mockCameraController;

  setUp(() {
    mockCameraController = MockZCameraController();
    cameraService = MockICamera();
  });
/* 
  group('CameraService', () {
    test('initialize should set up the camera controller', () async {
      when(mockCameraController.initialize()).thenAnswer((_) async => null);

      // Simulate availableCameras() response
      when(availableCameras()).thenAnswer((_) async => [
            CameraDescription(
              name: '0',
              lensDirection: CameraLensDirection.back,
              sensorOrientation: 0,
            ),
            CameraDescription(
              name: '1',
              lensDirection: CameraLensDirection.front,
              sensorOrientation: 0,
            ),
          ]);

      await cameraService.initialize();

      expect(cameraService.cameraController, isNotNull);
      verify(mockCameraController.initialize()).called(1);
    });

    test('takePicture should capture an image', () async {
      final mockXFile = MockZXFile();
      when(mockXFile.path).thenReturn('path/to/file');
      when(mockCameraController.takePicture())
          .thenAnswer((_) async => mockXFile);
      when(mockCameraController.value).thenReturn(FakeCameraValue());

      cameraService = MockICamera();


      final file = await cameraService.takePicture();

      expect(file, isNotNull);
      expect(file?.path, 'path/to/file');
      verify(mockCameraController.takePicture()).called(1);
    });

    test('setFlashMode should set the flash mode', () async {
      when(mockCameraController.setFlashMode(any))
          .thenAnswer((_) async => null);

      cameraService = MockICamera();


      await cameraService.setFlashMode(ZFlashMode.auto);

      verify(mockCameraController.setFlashMode(FlashMode.auto)).called(1);
    });

    test('dispose should clean up resources', () {
      cameraService = MockICamera();

      cameraService.dispose();

      verify(mockCameraController.dispose()).called(1);
    });
  }); */
}
