import 'package:camera/camera.dart';

List<CameraDescription> cameras = [];
CameraDescription camera=cameras.length>1?cameras[1]:cameras[0];
CameraController captureController =
    CameraController(camera, ResolutionPreset.medium);
CameraController scanningController =
    CameraController(camera, ResolutionPreset.medium);
