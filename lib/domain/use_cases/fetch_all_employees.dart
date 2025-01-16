import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:facein/domain/repositories/employee_repository.dart';

import '../entities/employee_model.dart';
import '../failures/failures.dart';

class FetchAllEmployees {
  EmployeeRepository employeeRepository;
  FetchAllEmployees(this.employeeRepository);
  Future<Either<Failure, List<Employee>>> call() async {
    final res = await employeeRepository.getEmployees();
    return res.fold((failure) {
      log('usecasefail:${failure.message}');
      return Left(failure);
    }, (success) {
      return Right(success);
    });
  }
}
