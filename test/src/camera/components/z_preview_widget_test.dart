
import 'package:camera_poc/core/shared/services/camera/library/z_flash_mode.dart';
import 'package:camera_poc/src/camera/components/z_preview_widget.dart';
import 'package:camera_poc/src/camera/components/ztake_picture.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


import '../../../fake_zcamera_controller.dart';
import '../page/camera_page_test.mocks.dart';


void main() {
  late MockCameraPageController mockController;

  setUp(() {
    mockController = MockCameraPageController();
  });

  group('ZPreviewWidget', () {
    testWidgets('displays proper message when camera is not initialized',
        (WidgetTester tester) async {
      // Mock behavior when cameraController is not initialized
      when(mockController.cameraController).thenReturn(null);

      await tester.pumpWidget(MaterialApp(
        home: ZPreviewWidget(cameraPageController: mockController),
      ));

      expect(find.text('OPS!'), findsOneWidget);
      expect(find.text('A Câmera não está disponível !'), findsOneWidget);
    });

    testWidgets('displays ZTakePicture when camera is initialized',
        (WidgetTester tester) async {
      when(mockController.initialize()).thenAnswer((_) => Future.value());
         when(mockController.flashMode).thenReturn(ZFlashMode.torch);
      // Mock behavior when cameraController is initialized
      when(mockController.cameraController)
          .thenReturn(FakeZCameraController()); // Replace with your mock

      await tester.pumpWidget(MaterialApp(
        home: ZPreviewWidget(cameraPageController: mockController),
      ));

      expect(find.byType(ZTakePicture), findsOneWidget);
    });
  });
}
