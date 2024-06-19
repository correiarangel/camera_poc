import 'dart:developer';

import 'package:camera/camera.dart';

import 'package:camera_poc/core/shared/services/camera/adapters/z_flash_mode_adapter.dart';
import 'package:camera_poc/core/shared/services/camera/adapters/z_xfile_adapter.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_camera_controller.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_camera_exceptiom.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_flash_mode.dart';
import 'package:camera_poc/core/shared/services/camera/library/z_xfile.dart';

import 'i_camera.dart';

class CameraService implements ICamera {
  ZCameraController? _cameraController;

  @override
  ZCameraController? get cameraController {
    if (_cameraController != null) return _cameraController!;

    return null;
  }

  @override
  Future<ZCameraController> initialize() async {
    final cameras = await availableCameras();
    final secondCamera = cameras[1];

    _cameraController = ZCameraController(
      secondCamera,
      ResolutionPreset.high,
    );

    try {
      await _cameraController?.initialize();
      return _cameraController!;
    } on CameraException catch (err) {
      throw ZCameraException(err.code, err.description);
    } on Exception catch (err, s) {
      log('Erro: takePicture desconhecido', stackTrace: s);
      throw ZCameraException('-1', 'Erro: takePicture desconhecido');
    }
  }

  @override
  Future<ZXFile?> takePicture() async {
    XFile? file;
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      try {
        if (_cameraController != null) {
          file = await _cameraController!.takePicture();
        }
      } on CameraException catch (err) {
        throw ZCameraException(err.code, err.description);
      } on Exception catch (err, s) {
        log('Erro: takePicture desconhecido', stackTrace: s);
        throw ZCameraException('-1', 'Erro: takePicture desconhecido');
      }
    }
    if (file == null) throw CameraException('-1', 'Erro: retornada NULL');
    return ZXFileAdapter.toZXFile(file);
  }

  @override
  void dispose() {
    _cameraController?.dispose();
  }

  @override
  Future<void> setFlashMode(ZFlashMode mode) async {
    if (_cameraController == null) {
      return;
    }

    try {
      await _cameraController!
          .setFlashMode(ZFlashModeAdapter.toFlashMode(mode));
    } on CameraException catch (err) {
      throw ZCameraException(err.code, err.description);
    }
  }
}
