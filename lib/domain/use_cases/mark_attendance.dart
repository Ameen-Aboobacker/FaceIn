import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:facein/domain/repositories/attendance_repository.dart';

import '../failures/failures.dart';

class MarkAttendance {
  AttendanceRepository attendanceRepository;
  MarkAttendance(this.attendanceRepository);
  Future<Either<Failure, Enum>> call(String employeeId, DateTime date) async {
    final time = await attendanceRepository.markAttendance(employeeId, date);

    return time.fold(
      (fail) {
        log('att fail :$fail');
        return Left(fail);
      },
      (punchType) {
        
        return Right(punchType);
      },
    );
  }
}
