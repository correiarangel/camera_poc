import 'package:camera_poc/core/shared/services/camera/camera_service.dart';
import 'package:camera_poc/src/camera/controller/camera_page_controller.dart';
import 'package:camera_poc/src/camera/repository/camera_repository.dart';
import 'package:flutter/material.dart';

import '../camera/page/camera_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CameraPage(
                            controller: CameraPageController(RepositoryCamera( CameraService())),
                          ) /* CameraLocalPage(
                      cameraController: CameraLocalController(
                       ComCameraService(),
                      ),
                    ),  */
                      ),
                );
              },
              icon: const Icon(Icons.camera_alt_outlined))
        ],
      ),
    );
  }
}
