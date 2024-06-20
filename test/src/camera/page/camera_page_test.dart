import 'package:camera/camera.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_camera_controller.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_xfile.dart';
import 'package:camera_poc/src/camera/controller/camera_page_controller.dart';
import 'package:camera_poc/src/camera/repository/camera_repository.dart';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:camera_poc/core/shared/services/camera/i_camera.dart';

import '../../../fake_zcamera_controller.dart';
import 'camera_page_test.mocks.dart';

//class MockRepositoryCamera extends Mock implements IRepositoryCamera {}
@GenerateMocks([
  CameraPageController,
  ZCameraController,
  IRepositoryCamera,
  CameraValue,
  ICamera,
  ZXFile
])
void main() {
  late IRepositoryCamera mockRepository;
  late CameraPageController cameraPageController;
  late ZCameraController mockCameraController;
  late MockZXFile mockZXFile;
  late CameraValue mockCameraValue;
  late ICamera seviceMock;

  setUp(() {
    //seviceMock = MockCameraService();
    mockRepository = MockIRepositoryCamera();
    mockCameraController = FakeZCameraController();
    mockZXFile = MockZXFile();
    mockCameraValue = MockCameraValue(); //FakeCameraValue();
    seviceMock = MockICamera();
    cameraPageController = CameraPageController(mockRepository);

        // Configurando valores mock para evitar valores nulos
    when(mockCameraController.value).thenReturn(mockCameraValue);
    when(mockCameraValue.isInitialized).thenReturn(true);
    when(mockCameraValue.isRecordingVideo).thenReturn(false);
    when(mockCameraValue.previewPauseOrientation).thenReturn(DeviceOrientation
        .portraitDown); // Adicionando mock para previewPauseOrientation
    when(mockCameraValue.deviceOrientation)
        .thenReturn(DeviceOrientation.portraitDown);
  });

/* 
  group('CameraPage', () {
    testWidgets('should initialize the camera on startup',
        (WidgetTester tester) async {
      when(mockRepository.initialize()).thenAnswer((_) async => mockCameraController);
      when(mockCameraController.value).thenReturn(mockCameraValue);
      when(cameraPageController.initialize()).thenAnswer((_) async => {});
      await tester.pumpWidget(MaterialApp(
        home: CameraPage(controller: cameraPageController),
      ));

      await tester.pump(); // Wait for the Future to complete

      verify(cameraPageController.initialize()).called(1);
      expect(cameraPageController.cameraController, isNotNull);
    });

    testWidgets('should display ZPreviewWidget when camera is initialized',
        (WidgetTester tester) async {
      when(mockRepository.initialize())
          .thenAnswer((_) async => mockCameraController);
      when(mockCameraController.value).thenReturn(mockCameraValue);

      await tester.pumpWidget(MaterialApp(
        home: CameraPage(controller: cameraPageController),
      ));

      await tester.pump(); // Wait for the Future to complete

      expect(find.byType(ZPreviewWidget), findsOneWidget);
    });

    testWidgets('should display captured image when takePicture is called',
        (WidgetTester tester) async {
      when(mockRepository.initialize())
          .thenAnswer((_) async => mockCameraController);
      when(mockRepository.takePicture()).thenAnswer((_) async => mockZXFile);
      when(mockCameraController.value).thenReturn(mockCameraValue);

      await tester.pumpWidget(MaterialApp(
        home: CameraPage(controller: cameraPageController),
      ));

      await tester.pump(); // Wait for the Future to complete
      await cameraPageController.takePicture();
      await tester.pump(); // Rebuild the widget tree

      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(ZPreviewWidget), findsNothing);
    });

    testWidgets('should set flash mode and notify listeners',
        (WidgetTester tester) async {
      when(mockRepository.initialize())
          .thenAnswer((_) async => mockCameraController);
      when(mockCameraController.value).thenReturn(mockCameraValue);
      await tester.pumpWidget(MaterialApp(
        home: CameraPage(controller: cameraPageController),
      ));

      await tester.pump(); // Wait for the Future to complete
      await cameraPageController.setFlash(ZFlashMode.auto);
      await tester.pump(); // Rebuild the widget tree

      expect(cameraPageController.flashMode, ZFlashMode.auto);
    });

    testWidgets('should call dispose on the repository when disposed',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: CameraPage(controller: cameraPageController),
      ));

      cameraPageController.dispose();

      verify(mockRepository.dispose()).called(1);
    });
  }); */
}
