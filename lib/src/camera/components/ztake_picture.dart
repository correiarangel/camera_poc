import 'package:camera_poc/core/shared/services/camera/library/z_flash_mode.dart';
import 'package:flutter/material.dart';

import 'package:camera_poc/src/camera/controller/camera_page_controller.dart';

class ZTakePicture extends StatelessWidget {
  final CameraPageController controller;
  const ZTakePicture({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 100;
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(32)),
        width: width * 80,
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            final flashMode = controller.flashMode;

            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.lightbulb,
                    color: (flashMode == ZFlashMode.always)
                        ? Colors.yellow
                        : Colors.white,
                    size: 24,
                  ),
                  onPressed: () => controller.setFlash(ZFlashMode.always),
                ),
                IconButton(
                  icon: Icon(
                    Icons.flash_on,
                    color: (flashMode == ZFlashMode.torch)
                        ? Colors.yellow
                        : Colors.white,
                    size: 24,
                  ),
                  onPressed: () => controller.setFlash(ZFlashMode.torch),
                ),
                const SizedBox(
                  width: 32,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 30,
                  ),
                  hoverColor: Colors.yellow,
                  enableFeedback: true,
                  onPressed: controller.takePicture,
                ),
                const SizedBox(
                  width: 32,
                ),
                IconButton(
                  icon: Icon(
                    Icons.flash_off,
                    color: (flashMode == ZFlashMode.off)
                        ? Colors.yellow
                        : Colors.white,
                    size: 24,
                  ),
                  onPressed: () => controller.setFlash(ZFlashMode.off),
                ),
                IconButton(
                  icon: Icon(
                    Icons.flash_auto,
                    color: (flashMode == ZFlashMode.auto)
                        ? Colors.yellow
                        : Colors.white,
                    size: 24,
                  ),
                  onPressed: () => controller.setFlash(ZFlashMode.auto),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
