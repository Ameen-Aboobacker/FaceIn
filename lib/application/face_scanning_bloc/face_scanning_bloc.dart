import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:facein/domain/entities/employee_model.dart';
import 'package:facein/domain/use_cases/verify_face.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/camera_controllers.dart';

part 'face_scanning_event.dart';
part 'face_scanning_state.dart';

class FaceScanningBloc extends Bloc<FaceScanningEvent, FaceScanningState> {
  final VerifyFace verifyFace;
  FaceScanningBloc(this.verifyFace) : super(ScanningInitial()) {
    on<ScanningFace>((event, emit) async {
      emit(Scanning());
      try {
        XFile? image;

        image = await scanningController.takePicture();
        log(image.name);

        final photo = File(image.path);
        final Employee? employee = await verifyFace(photo);
        if (employee == null) {
          emit(ScanningFailed('scanning Failed'));
        } else {
          emit(ScanningSuccess(employee));
        }
      } catch (e) {
        emit(ScanningFailed(e.toString()));
      }
    });
  }
}
