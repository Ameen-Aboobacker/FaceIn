import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:facein/data/employee_model.dart';
import 'package:facein/domain/funtions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'employee_registration_event.dart';
part 'employee_registration_state.dart';

class EmployeeRegistrationBloc
    extends Bloc<EmployeeRegistrationEvent, EmployeeRegistrationState> {
  EmployeeRegistrationBloc() : super(RegistrationInitial()) {
    on<Registration>((event, emit) async {
      try {
        emit(RegistrationLoading());
        await Future.delayed(Duration(seconds: 3), () {
          log('processing');
        });
        // await registerEmployee(employee: event.employee, image: event.image);
        emit(RegistrationSuccess());
      } catch (e) {
        emit(RegistrationFailed(error: e.toString()));
      }
    });
  }
}
