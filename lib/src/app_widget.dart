import 'package:camera_poc/src/home/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  /// Default Constructor
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
