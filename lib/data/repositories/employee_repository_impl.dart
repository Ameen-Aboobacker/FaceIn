import 'dart:io';

import 'package:facein/domain/entities/employee_model.dart';

import '../../domain/repositories/employee_repository.dart';
import '../data_sources/fireabse_data_source.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final FirebaseDataSource firebaseDataSource;

  EmployeeRepositoryImpl(this.firebaseDataSource);
  @override
  Future<void> saveEmployeeDetails(Employee employee) {
    return firebaseDataSource.saveEmployeeDetails(employee);
  }

  @override
  Future<String> uploadPhoto(File photo) {
    return firebaseDataSource.uploadPhoto(photo);
  }

  @override
  Future<Employee> fetchEmployeeDetails(String faceId) {
    return firebaseDataSource.fetchEmployee(faceId);
  }
}
