import 'package:camera_poc/core/shared/services/camera/library/z_preview_camera.dart';
import 'package:camera_poc/src/camera/controller/camera_page_controller.dart';
import 'package:flutter/material.dart';

import 'package:camera_poc/src/camera/components/ztake_picture.dart';

class ZPreviewWidget extends StatelessWidget {
  final CameraPageController cameraPageController;

  const ZPreviewWidget({
    super.key,
    required this.cameraPageController,
  });

  @override
  Widget build(BuildContext context) {
    final cameraController = cameraPageController.cameraController;
    Widget widget = const Center(
      child: Text(
        'Widget camera não contruidos :(',
      ),
    );
    if (cameraController == null || !cameraController.value.isInitialized) {
      widget = const Column(
        children: [
          SizedBox(height: 64),
          Text('OPS!', style: TextStyle(fontSize: 32)),
          Icon(
            Icons.camera_outdoor,
            size: 32,
          ),
          Text(
            'A Câmera não está disponível !',
            style: TextStyle(fontSize: 24),
          )
        ],
      );
    }

    if (cameraController != null) {
      widget = Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          //  CameraPreview(ZCameraControllerAdapter.toController( cameraController!)),
          ZPreviewCamera(cameraController),
          ZTakePicture(
            controller: cameraPageController,
          )
          // _botaoCapturaWidget(),
        ],
      );
    }

    return widget;
  }
}
