import 'dart:io';

import '../entities/employee_model.dart';

abstract class EmployeeRepository {
  Future<String> uploadPhoto(File photo);
  Future<void> saveEmployeeDetails(Employee employee);
  Future<Employee> fetchEmployeeDetails(String faceId);
}
