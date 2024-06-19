import 'package:camera/camera.dart';
import 'package:camera_poc/core/shared/services/camera/adapters/z_camera_controller_adapter.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_camera_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCameraController extends Mock implements CameraController {}

class MockCameraControllerZ extends Mock implements ZCameraController {}

class MockCameraDescription extends Mock implements CameraDescription {}

void main() {
  setUpAll(() {
    registerFallbackValue(MockCameraDescription());
    registerFallbackValue(ResolutionPreset.high);
  });

  group('ZCameraControllerAdapter', () {
    test('toControllerZ converts CameraController to CameraControllerZ', () {
      final mockCameraDescription = MockCameraDescription();
      final mockCameraController = MockCameraController();
      when(() => mockCameraController.description)
          .thenReturn(mockCameraDescription);
      when(() => mockCameraController.resolutionPreset)
          .thenReturn(ResolutionPreset.high);

      final result =
          ZCameraControllerAdapter.toControllerZ(mockCameraController);

      expect(result, isA<ZCameraController>());
      expect(result.description, equals(mockCameraDescription));
      expect(result.resolutionPreset, equals(ResolutionPreset.high));
    });

    test('toController converts CameraControllerZ to CameraController', () {
      final mockCameraDescription = MockCameraDescription();
      final mockCameraControllerZ = MockCameraControllerZ();
      when(() => mockCameraControllerZ.description)
          .thenReturn(mockCameraDescription);
      when(() => mockCameraControllerZ.resolutionPreset)
          .thenReturn(ResolutionPreset.high);

      final result =
          ZCameraControllerAdapter.toController(mockCameraControllerZ);

      expect(result, isA<CameraController>());
      expect(result.description, equals(mockCameraDescription));
      expect(result.resolutionPreset, equals(ResolutionPreset.high));
    });
  });
}
