

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';

import 'core/shared/services/camera/adapters/z_camera_controller_adapter_test.dart';
import 'core/shared/services/camera/camera_service_test.dart';

class FakeCameraValue implements CameraValue {
  @override
  
  double get aspectRatio =>100;

  @override
  CameraValue copyWith({bool? isInitialized, bool? isRecordingVideo, bool? isTakingPicture, bool? isStreamingImages, String? errorDescription, Size? previewSize, bool? isRecordingPaused, FlashMode? flashMode, ExposureMode? exposureMode, FocusMode? focusMode, bool? exposurePointSupported, bool? focusPointSupported, DeviceOrientation? deviceOrientation, Optional<DeviceOrientation>? lockedCaptureOrientation, Optional<DeviceOrientation>? recordingOrientation, bool? isPreviewPaused, CameraDescription? description, Optional<DeviceOrientation>? previewPauseOrientation,}) {

  return FakeCameraValue();
  }

  @override
  CameraDescription get description => MockCameraDescription();

  @override
  DeviceOrientation get deviceOrientation => throw UnimplementedError();

  @override
  String? get errorDescription => 'errorDescription';

  @override
  ExposureMode get exposureMode => ExposureMode.auto;

  @override
  bool get exposurePointSupported => false;

  @override
  FlashMode get flashMode => FlashMode.off;

  @override
  FocusMode get focusMode =>FocusMode.auto;

  @override
  bool get focusPointSupported => false;

  @override
  bool get hasError => throw UnimplementedError();

  @override
  bool get isCaptureOrientationLocked => false;

  @override
  bool get isInitialized => true;

  @override
  bool get isPreviewPaused => false;

  @override
  bool get isRecordingPaused =>false;

  @override
  bool get isRecordingVideo => false;

  @override
  bool get isStreamingImages => false;

  @override
  bool get isTakingPicture =>true;

  @override
  DeviceOrientation? get lockedCaptureOrientation => DeviceOrientation.portraitDown;

  @override
  DeviceOrientation? get previewPauseOrientation => DeviceOrientation.portraitDown;

  @override
  Size? get previewSize =>Size(100, 100);

  @override
  DeviceOrientation? get recordingOrientation => DeviceOrientation.portraitDown;
}