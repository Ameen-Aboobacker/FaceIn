
import 'package:dartz/dartz.dart';
import 'package:facein/domain/repositories/employee_repository.dart';

import '../entities/employee_model.dart';
import '../failures/failures.dart';

class FetchSingleEmployee {
  EmployeeRepository employeeRepository;
  FetchSingleEmployee(this.employeeRepository);
  Future<Either<Failure, Employee>> call(String faceId) async {
    final res = await employeeRepository.fetchEmployeeDetails(faceId);
    return res.fold((failure) {
      return Left(failure);
    }, (success) {
      return Right(success);
    });
  }
}
