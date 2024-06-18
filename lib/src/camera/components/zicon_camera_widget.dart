import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ZIconCameraWidget extends StatelessWidget {
  final CameraLensDirection direction;
  const ZIconCameraWidget({super.key, required this.direction});

  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.camera;
    switch (direction) {
      case CameraLensDirection.back:
        icon = Icons.camera_rear;
        break;
      case CameraLensDirection.front:
        icon = Icons.camera_front;
        break;
      case CameraLensDirection.external:
        icon = Icons.camera;
        break;
    }

    return Icon(icon);
  }
}
