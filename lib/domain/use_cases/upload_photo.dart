import 'dart:io';

import 'package:dartz/dartz.dart';

import '../failures/failures.dart';
import '../repositories/employee_repository.dart';

class UploadPhoto {
  final EmployeeRepository employeeRepository;

  UploadPhoto(this.employeeRepository);

  Future<Either<Failure,String>> call(File photo,String path) async {
    return await employeeRepository.uploadPhoto(photo,path);
  }
}

