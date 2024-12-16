import 'dart:developer';
import 'dart:io';

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

  Future<Employee?> call(File photo) async {
    final faceId = await faceRekognitionRepository.verifyFace(photo);
    log('face:$faceId');
    if (faceId == null) {
      return null;
    } else {
      final Employee employee =
          await employeeRepository.fetchEmployeeDetails(faceId);
      await attendanceRepository.markAttendance(employee.employeeId);

      return employee;
    }
  }
}
