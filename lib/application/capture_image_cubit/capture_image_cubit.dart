
import 'package:camera/camera.dart';
import 'package:facein/core/camera_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'capture_image_state.dart';

class CaptureImageCubit extends Cubit<CaptureImageState> {
  CaptureImageCubit() : super(CaptureImageInitial());
   XFile? image;
  Future<void> captureImage() async {
    emit(ImageCapturing());
   image = await captureController.takePicture();
    emit(ImageCaptured(image!));
  }
   Future<void> scanImage() async {
    emit(ImageCapturing());
   image = await scanningController.takePicture();
    emit(ImageCaptured(image!));
  }
}
