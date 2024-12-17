import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:facein/domain/failures/failures.dart';

import '../entities/employee_model.dart';

import '../repositories/attendance_repository.dart';
import '../repositories/employee_repository.dart';
import '../repositories/face_rekognition_repository.dart';

class VerifyFace {
  final EmployeeRepository employeeRepository;
  final FaceRekognitionRepository faceRekognitionRepository;
  final AttendanceRepository attendanceRepository;
  VerifyFace(this.employeeRepository, this.faceRekognitionRepository,
      this.attendanceRepository);

  Future<Either<Failure, Employee>> call(File photo) async {
    final faceId = await faceRekognitionRepository.verifyFace(photo);
    log('face:$faceId');
    return faceId.fold((failure) {
      return Left(failure);
    }, (success) async {
      final Employee employee =
          await employeeRepository.fetchEmployeeDetails(success);
      await attendanceRepository.markAttendance(employee.employeeId);

      return Right(employee);
    });
    
  }
}
