import 'package:camera/camera.dart';
import 'package:camera_poc/core/shared/services/camera/adapters/z_flash_mode_adapter.dart';
import 'package:camera_poc/core/shared/services/camera/i_camera.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_camera_controller.dart';
import 'package:camera_poc/src/camera/repository/camera_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_xfile.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_flash_mode.dart';

class MockCameraControllerZ extends Mock implements ZCameraController {}

class MockXFile extends Mock implements XFile {}

class MockCameraDescription extends Mock implements CameraDescription {}

class MockCameraSevice extends Mock implements ICamera {}


void main() {
  late ICamera seviceMock;
  late IRepositoryCamera repositoryCamera;
  late MockCameraControllerZ mockCameraController;

  setUp(() {
    seviceMock = MockCameraSevice();
    mockCameraController = MockCameraControllerZ();
    repositoryCamera = RepositoryCamera(seviceMock);
  });

  group('RepositoryCamera', () {
    test('initialize should initialize the camera', () async {
      when(() => seviceMock.initialize())
          .thenAnswer((_) async => mockCameraController);

      final result = await repositoryCamera.initialize();

      expect(result, isNotNull);
      expect(result, isA<ZCameraController>());
    });

    test('takePicture should return a ZXFile', () async {
      final xFile = ZXFile('path/to/file');

      when(() => seviceMock.takePicture()).thenAnswer((_) async => xFile);
      final result = await repositoryCamera.takePicture();

      expect(result, isA<ZXFile>());
      expect(result?.path, xFile.path);
    });

    test('setFlash should set the flash mode', () async {
      const mode = ZFlashMode.off;
      when(() => seviceMock.setFlashMode(mode)).thenAnswer((_) async {});
      when(() => mockCameraController.setFlashMode(
          ZFlashModeAdapter.toFlashMode(mode))).thenAnswer((_) async {});

      //await repositoryCamera.setFlash(mode);
      expect(repositoryCamera.setFlash(mode), completes);
      // verify(() => repositoryCamera.setFlash(mode)).called(1);
    });

    test('dispose should dispose the camera controller', () {
      repositoryCamera.dispose();
      verify(() => repositoryCamera.dispose()).called(1);
    });
  });
}
