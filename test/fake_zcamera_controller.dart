import 'package:camera/camera.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_camera_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:mocktail/mocktail.dart';

import 'fake_camera_value.dart';

class FakeZCameraController extends Mock implements ZCameraController {
  @override
  CameraValue value = FakeCameraValue();

  @override
  Widget buildPreview() {

   return const SizedBox.shrink() ;
  }

}
