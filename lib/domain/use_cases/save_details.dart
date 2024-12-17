import 'package:dartz/dartz.dart';

import '../entities/employee_model.dart';
import '../failures/failures.dart';
import '../repositories/employee_repository.dart';

class SaveEmployeeDetails {
  final EmployeeRepository employeeRepository;

  SaveEmployeeDetails(this.employeeRepository);

  Future<Either<Failure, Unit>> call(Employee employee) async {
    final res = await employeeRepository.saveEmployeeDetails(employee);
    return res.fold(
      (fail) => Left(fail),
      (succes) => Right(succes),
    );
  }
}
