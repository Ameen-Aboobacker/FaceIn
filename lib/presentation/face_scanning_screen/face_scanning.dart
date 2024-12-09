import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../core/camera_controllers.dart';
class FaceScanning extends StatelessWidget {
const FaceScanning({ super.key });

  @override
  Widget build(BuildContext context){
   return  Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        child: CameraPreview(scanningController),
      )
    );
  }
}