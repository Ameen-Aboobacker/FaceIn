import 'dart:io';

import '../repositories/employee_repository.dart';

class UploadPhoto {
  final EmployeeRepository employeeRepository;

  UploadPhoto(this.employeeRepository);

  Future<String> call(File photo) async {
    return await employeeRepository.uploadPhoto(photo);
  }
}

