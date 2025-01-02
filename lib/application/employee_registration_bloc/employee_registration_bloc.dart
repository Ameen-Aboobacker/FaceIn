import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:facein/data/data_sources/template_data_source.dart';
import 'package:facein/domain/entities/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/failures/failures.dart';
import '../../domain/use_cases/orchestrator_classes/register_employee.dart';

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
        final photo = File(event.image!.path);
        final res = await registerEmployee(event.employee, photo);
        log(event.employee.toJson().toString());

        res.fold((left) {
          emit(RegistrationFailure(error: left));
        }, (right) {
          emit(RegistrationSuccess(event.employee));
        });
      } catch (e) {
        emit(
          RegistrationFailure(
            error: Failure.unexpected(
              e.toString(),
            ),
          ),
        );
      }
    });
    on<SampleRegEvent>((event, emit) async {
      emit(RegistrationLoading());
      try {
        final Either<Failure, Unit> res =
            await Future.delayed(const Duration(seconds: 4), () async {
          return await templateDataSource.indexSFace();
        });
        res.fold((left) {
          emit(RegistrationFailure(error: left));
        }, (right) {
          emit(RegistrationSuccess(Employee(
              name: 's',
              designation: '',
              email: '',
              contact: '65',
              createdAt: Timestamp.now())));
        });
      } catch (e) {
        log(e.toString());
        emit(
          RegistrationFailure(
            error: Failure.unexpected(
              e.toString(),
            ),
          ),
        );
      }
    });
  }
}
