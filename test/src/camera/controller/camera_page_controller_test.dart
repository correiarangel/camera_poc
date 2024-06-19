import 'package:camera_poc/core/shared/services/camera/library/z_camera_controller.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_flash_mode.dart';
import 'package:camera_poc/src/camera/controller/camera_page_controller.dart';
import 'package:camera_poc/src/camera/repository/camera_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_xfile.dart';

class _MockRepositoryCamera extends Mock implements IRepositoryCamera {}
class _MockCameraControllerZauris extends Mock implements ZCameraController {}
class MockZXFile extends Mock implements ZXFile {}

void main() {
  late _MockRepositoryCamera mockRepositoryCamera;
  late CameraPageController cameraPageController;
  late _MockCameraControllerZauris mockCameraController;

  setUp(() {
    mockRepositoryCamera = _MockRepositoryCamera();
    cameraPageController = CameraPageController(mockRepositoryCamera);
    mockCameraController = _MockCameraControllerZauris();
  });

  group('CameraPageController', () {
    test('initialize should initialize the camera and notify listeners', () async {
      when(() => mockRepositoryCamera.initialize())
          .thenAnswer((_) async => mockCameraController);

      await cameraPageController.initialize();

      expect(cameraPageController.cameraController, isNotNull);
      expect(cameraPageController.cameraController, isA<ZCameraController>());
      verify(() => mockRepositoryCamera.initialize()).called(1);
    });

    test('takePicture should take a picture and notify listeners', () async {
      final mockZXFile = MockZXFile();
      when(() => mockRepositoryCamera.takePicture())
          .thenAnswer((_) async => mockZXFile);

      await cameraPageController.takePicture();

      expect(cameraPageController.image, isNotNull);
      expect(cameraPageController.image, isA<ZXFile>());
      verify(() => mockRepositoryCamera.takePicture()).called(1);
    });

    test('setFlash should set the flash mode and notify listeners', () async {
      const mode = ZFlashMode.auto;
      when(() => mockRepositoryCamera.setFlash(mode))
          .thenAnswer((_) async {});

      await cameraPageController.setFlash(mode);

      expect(cameraPageController.flashMode, mode);
      verify(() => mockRepositoryCamera.setFlash(mode)).called(1);
    });

    test('changesFlash should change the flash mode and notify listeners', () async {
      const mode = ZFlashMode.torch;

      cameraPageController.changesFlash(mode);

      expect(cameraPageController.flashMode, ZFlashMode.torch);
    });

    test('dispose should dispose the repository camera', () {
      cameraPageController.dispose();

      verify(() => mockRepositoryCamera.dispose()).called(1);
    });
  });
}
