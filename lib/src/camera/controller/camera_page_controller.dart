import 'package:camera_poc/core/shared/services/camera/library/z_flash_mode.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_xfile.dart';
import 'package:camera_poc/src/camera/repository/camera_repository.dart';
import 'package:flutter/material.dart';

import '../../../core/shared/services/camera/library/z_camera_controller.dart';

class CameraPageController extends ChangeNotifier {
  final IRepositoryCamera _repositoryCamera;
  CameraPageController(this._repositoryCamera);
  ZCameraController? _cameraController;
  ZCameraController? get cameraController => _cameraController;
  ZFlashMode _flashMode = ZFlashMode.off;
  ZFlashMode get flashMode => _flashMode;
  ZXFile? _image;
  ZXFile? get image => _image;

  Future<void> initialize() async {
    final camera = await _repositoryCamera.initialize();
    _cameraController = camera;
    notifyListeners();
  }

  Future<void> takePicture() async {
    _image = await _repositoryCamera.takePicture();
    notifyListeners();
  }

  Future<void> setFlash(ZFlashMode mode) async {
    changesFlash(mode);
    await _repositoryCamera.setFlash(mode);
  }

  @override
  void dispose() {
    _repositoryCamera.dispose();
    super.dispose();
  }

  void changesFlash(ZFlashMode mode) {
    _flashMode = mode;
    notifyListeners();
  }
}
