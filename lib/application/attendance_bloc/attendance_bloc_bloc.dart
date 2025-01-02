import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/attendance_model.dart';
import '../../domain/use_cases/fetch_attendance_records.dart';

part 'attendance_bloc_event.dart';
part 'attendance_bloc_state.dart';

class AttendanceBlocBloc
    extends Bloc<AttendanceBlocEvent, AttendanceBlocState> {
  final FetchAttendanceUsecase fetchAttendance;
  AttendanceBlocBloc(this.fetchAttendance) : super(AttendanceInit()) {
    on<FetchAttendance>((event, emit) async {
      try {
        final res = await fetchAttendance(event.id, event.date);
        res.fold((left) {
          log(left.message);
          emit(AttendanceFail(left.message));
        }, (right) {
          emit(AttendanceSuccess(right));
        });
      } catch (e) {
        emit(AttendanceFail(e.toString()));
      }
    });
  }
}
