import 'package:camera_poc/core/shared/services/camera/library/camera_controller_zauris.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_flash_mode.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_xfile.dart';
import 'package:camera_poc/src/camera/repository/camera_repository.dart';
import 'package:flutter/material.dart';

class CameraPageController extends ChangeNotifier {
  final IRepositoryCamera _repositoryCamera;
  CameraPageController(this._repositoryCamera);
  CameraControllerZauris? _cameraController;
  CameraControllerZauris? get cameraController => _cameraController;
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
    await _repositoryCamera.setFlash(mode);
  }


  @override
  void dispose() {
    _repositoryCamera.dispose();
    super.dispose();
  }
}

