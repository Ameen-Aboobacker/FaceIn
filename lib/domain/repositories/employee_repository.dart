import 'dart:io';

import 'package:dartz/dartz.dart';

import '../entities/employee_model.dart';
import '../failures/failures.dart';

abstract class EmployeeRepository {
  Future<Either<Failure, String>> uploadPhoto(File photo,path);
  Future<Either<Failure, Unit>> saveEmployeeDetails(Employee employee);
  Future<Either<Failure, Employee>> fetchEmployeeDetails(String faceId);
  Future<Either<Failure, List<Employee>>> getEmployees();
}
