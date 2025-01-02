import 'package:facein/domain/use_cases/fetch_all_employees.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/employee_model.dart';

part 'employee_fetch_event.dart';
part 'employee_fetch_state.dart';

class EmployeeFetchBloc extends Bloc<EmployeeFetchEvent, EmployeeFetchState> {
  FetchAllEmployees fetchAllEmployee;
  EmployeeFetchBloc(this.fetchAllEmployee) : super(Initial()) {
    on<FetchEmployees>((event, emit) async {
      emit(FetchLoading());
      final res = await fetchAllEmployee();
      res.fold(
        (fail) {
          emit(FetchFailed());
        },
        (success) {
          emit(FetchSuccess(success));
        },
      );
    });
  }
}
