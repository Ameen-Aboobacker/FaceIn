

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'employee_registration_event.dart';
part 'employee_registration_state.dart';

class EmployeeRegistrationBloc extends Bloc<EmployeeRegistrationEvent, EmployeeRegistrationState> {
  EmployeeRegistrationBloc() : super(EmployeeRegistrationInitial()) {
    on<EmployeeRegistrationEvent>((event, emit) {
    
    });
  }
}
