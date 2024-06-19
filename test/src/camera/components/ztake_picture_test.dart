import 'package:camera_poc/src/camera/components/ztake_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_flash_mode.dart';

import '../page/camera_page_test.mocks.dart';



void main() {
  late MockCameraPageController mockController;

  setUp(() {
    mockController = MockCameraPageController();
  });

  group('ZTakePicture Widget', () {
        testWidgets('should display icons based on flash mode', (WidgetTester tester) async {
      when(mockController.flashMode).thenReturn(ZFlashMode.off);

      await tester.pumpWidget(MaterialApp(
        home: ZTakePicture(controller: mockController),
      ));

      expect(find.byIcon(Icons.lightbulb), findsOneWidget);
     // expect(find.byIcon(Icons.flash_on), findsNothing);
      expect(find.byIcon(Icons.flash_off), findsOneWidget);
      expect(find.byIcon(Icons.flash_auto), findsOneWidget);

      when(mockController.flashMode).thenReturn(ZFlashMode.torch);
      await tester.pump();

     // expect(find.byIcon(Icons.lightbulb), findsNothing);
      expect(find.byIcon(Icons.flash_on), findsOneWidget);
      expect(find.byIcon(Icons.flash_off), findsOneWidget);
      expect(find.byIcon(Icons.flash_auto), findsOneWidget);

      when(mockController.flashMode).thenReturn(ZFlashMode.always);
      await tester.pump();

      expect(find.byIcon(Icons.lightbulb), findsOneWidget);

      expect(find.byIcon(Icons.flash_off), findsOneWidget);
      expect(find.byIcon(Icons.flash_auto), findsOneWidget);

      when(mockController.flashMode).thenReturn(ZFlashMode.auto);
      await tester.pump();

      //expect(find.byIcon(Icons.lightbulb), findsNothing);
      expect(find.byIcon(Icons.flash_on), findsOneWidget);
      expect(find.byIcon(Icons.flash_off), findsOneWidget);
      expect(find.byIcon(Icons.flash_auto), findsOneWidget);
    });
   

    testWidgets('should call controller methods when buttons are pressed', (WidgetTester tester) async {
      when(mockController.flashMode).thenReturn(ZFlashMode.auto);
      await tester.pumpWidget(MaterialApp(
        home: ZTakePicture(controller: mockController),
      ));

      await tester.tap(find.byIcon(Icons.lightbulb));
      verify(mockController.setFlash(ZFlashMode.always)).called(1);

      await tester.tap(find.byIcon(Icons.flash_on));
      verify(mockController.setFlash(ZFlashMode.torch)).called(1);

      await tester.tap(find.byIcon(Icons.camera_alt));
      verify(mockController.takePicture()).called(1);

      await tester.tap(find.byIcon(Icons.flash_off));
      verify(mockController.setFlash(ZFlashMode.off)).called(1);

      await tester.tap(find.byIcon(Icons.flash_auto));
      verify(mockController.setFlash(ZFlashMode.auto)).called(1);
    });
  });
}