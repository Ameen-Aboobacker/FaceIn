import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';

import 'package:facein/domain/entities/verify_model.dart';
import 'package:facein/domain/failures/failures.dart';
import 'package:facein/domain/use_cases/orchestrator_classes/attendance_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/camera_controllers.dart';

part 'face_scanning_event.dart';
part 'face_scanning_state.dart';

class FaceScanningBloc extends Bloc<FaceScanningEvent, FaceScanningState> {
  final AttendanceUsecase attendanceUsecase;
  FaceScanningBloc(this.attendanceUsecase) : super(ScanningInitial()) {
    on<ScanningFace>((event, emit) async {
      XFile image;
      image = await scanningController.takePicture();

      final photo = File(image.path);
      emit(Scanning());
      try {
        final employee = await attendanceUsecase(photo);

        employee.fold((fail) {
          log('fail:$fail');
          emit(ScanningFailed(failure: fail));
        }, (success) {
          //  });
          emit(ScanningSuccess(success));
        });
      } catch (e) {
        emit(ScanningFailed(failure: Failure.unexpected(e.toString())));
      }
    });
  }
}
