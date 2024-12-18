import 'dart:io';

import 'package:camera/camera.dart';
import 'package:facein/domain/entities/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/register_employee.dart';

part 'employee_registration_event.dart';
part 'employee_registration_state.dart';

class EmployeeRegistrationBloc
    extends Bloc<EmployeeRegistrationEvent, EmployeeRegistrationState> {
  final RegisterEmployee registerEmployee;

  EmployeeRegistrationBloc(this.registerEmployee)
      : super(RegistrationInitial()) {
    on<Registration>((event, emit) async {
      emit(RegistrationLoading());
      try {
        final photo = File(event.image!.path);
        await registerEmployee(event.employee, photo);
        //log(event.employee.toJson().toString());
        emit(RegistrationSuccess(event.employee));
      } catch (e) {
        emit(RegistrationFailure(error: e.toString()));
      }
    });
  }
}
