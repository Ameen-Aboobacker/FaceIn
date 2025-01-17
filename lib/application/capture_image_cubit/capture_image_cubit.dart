import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:facein/core/camera_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'capture_image_state.dart';

class CaptureImageCubit extends Cubit<CaptureImageState> {
  CaptureImageCubit() : super(CaptureImageInitial());
  XFile? image;
  bool? isError;
  Future<void> captureImage() async {
    emit(ImageCapturing());
    image = await captureController.takePicture();
    emit(ImageCaptured(image!));
  }

  Future<void> scanImage() async {
    emit(ImageCapturing());
    await scanningController.startImageStream((image) {
      log(image.toString());
    });
    emit(ImageCaptured(image!));
  }

  bool checkImage() {
    if (image == null) {
      return false;
    }
    return true;
  }

  checkError() {
    log(isError.toString());
  }

  changeState() {
    image = null;
    emit(CaptureImageInitial());
  }
}
