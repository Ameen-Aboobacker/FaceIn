import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:facein/data/data_sources/template_data_source.dart';

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
      emit(Scanning());
      XFile image;
      try {
        image = await scanningController.takePicture();

        final photo = File(image.path);
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

    on<SampleScan>(
      (event, emit) async {
        emit(Scanning());
        try {
          final res = await TemplateDataSource.scansSFace();
          res.fold(
              (l) => emit(
                    ScanningFailed(failure: l),
                  ), (r) {
            return emit(ScanningSuccess(sample));
          });
        } catch (e) {
          emit(ScanningFailed(failure: Failure.unexpected(e.toString())));
        }
      },
    );
  }
}

final sample = VerifyModel(
  time: '01-01-2025, 03:16 PM',
  id: 'AIT100000042',
  name: 'AMEEN ABOOBACKER',
  image: const AssetImage('assets/images/user_icon.jpg'),
);
