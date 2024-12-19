
import 'package:camera/camera.dart';
import 'package:facein/data/data_sources/template_data_source.dart';
import 'package:facein/domain/entities/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/register_employee.dart';

part 'employee_registration_event.dart';
part 'employee_registration_state.dart';

class EmployeeRegistrationBloc
    extends Bloc<EmployeeRegistrationEvent, EmployeeRegistrationState> {
  final RegisterEmployee registerEmployee;
  final TemplateDataSource templateDataSource;
  EmployeeRegistrationBloc(this.registerEmployee, this.templateDataSource)
      : super(RegistrationInitial()) {
    on<Registration>((event, emit) async {
      emit(RegistrationLoading());
      try {
        /* final photo = File(event.image!.path);
        await registerEmployee(event.employee, photo);*/
        //log(event.employee.toJson().toString());

        final tmp = await templateDataSource.indexSFace();
        tmp.fold((left) {
          emit(RegistrationFailure(error: left.message));
        }, (right) {
          emit(RegistrationSuccess(event.employee));
        });
      } catch (e) {
        emit(RegistrationFailure(error: e.toString()));
      }
    });
  }
}
