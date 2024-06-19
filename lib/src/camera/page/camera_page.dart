import 'dart:developer';
import 'dart:io';

import 'package:camera_poc/src/camera/components/z_preview_widget.dart';
import 'package:camera_poc/src/camera/controller/camera_page_controller.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  final CameraPageController controller;

  const CameraPage({super.key, required this.controller});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  Size? size;
  @override
  void initState() {
/*     widget.controller.addListener(() {
      setState(() {});
    });  */
    widget.controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Z'),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: AnimatedBuilder(
        animation: widget.controller,
        builder: (context, chield) {
          final isInitialized =
              widget.controller.cameraController?.value.isInitialized ?? false;
          if (!isInitialized) {
            if (widget.controller.cameraController == null) {
              widget.controller.initialize();
            }
          }
          log(widget.controller.image?.path ?? 'NADA IMAGEL !...');
          return Container(
            color: Colors.grey[900],
            child: Center(
              child: SizedBox(
                width: size!.width - 16,
                height: size!.height - (size!.height / 5),
                child: widget.controller.image == null
                    ? ZPreviewWidget(
                        cameraPageController: widget.controller,
                      )
                    : Image.file(
                        File(widget.controller.image!.path),
                        fit: BoxFit.contain,
                      ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: AnimatedBuilder(
        animation: widget.controller,
        builder: (context, child) {
          return (widget.controller.image != null)
              ? FloatingActionButton.extended(
                  onPressed: () => Navigator.pop(context),
                  label: const Text('Finalizar'),
                )
              : const SizedBox.shrink();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
