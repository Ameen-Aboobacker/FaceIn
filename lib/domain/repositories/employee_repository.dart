import 'dart:io';


import 'package:dartz/dartz.dart';

import '../entities/employee_model.dart';
import '../failures/failures.dart';

abstract class EmployeeRepository {
  Future<Either<Failure,String>> uploadPhoto(File photo);
  Future<Either<Failure,Unit>> saveEmployeeDetails(Employee employee);
  Future<Employee> fetchEmployeeDetails(String faceId);
}
