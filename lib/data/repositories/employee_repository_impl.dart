import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../domain/entities/employee_model.dart';
import '../../domain/failures/failures.dart';
import '../../domain/repositories/employee_repository.dart';
import '../data_sources/fireabse_data_source.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final FirebaseDataSource firebaseDataSource;

  EmployeeRepositoryImpl(this.firebaseDataSource);
  @override
  Future<Either<Failure, Unit>> saveEmployeeDetails(Employee employee) {
    return firebaseDataSource.saveEmployeeDetails(employee);
  }

  @override
  Future<Either<Failure, String>> uploadPhoto(File photo) {
    return firebaseDataSource.uploadPhoto(photo);
  }

  @override
  Future<Either<Failure,Employee>> fetchEmployeeDetails(String faceId) {
    return firebaseDataSource.fetchEmployee(faceId);
  }

  @override
  Future<Either<Failure, List<Employee>>> getEmployees() {
    return firebaseDataSource.fetchAllEmployees();
  }
}
