import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:facein/domain/repositories/attendance_repository.dart';
import 'package:intl/intl.dart';

import '../failures/failures.dart';

class MarkAttendance {
  AttendanceRepository attendanceRepository;
  MarkAttendance(this.attendanceRepository);
  Future<Either<Failure,String>> call(String employeeId) async{
     final time = await attendanceRepository.markAttendance(employeeId);

      return time.fold(
        (fail) {
          log('att fail :$fail');
          return Left(fail);
        },
        (attendanceTime) {
          final newTime =
              DateFormat('MMMM,dd,yyyy hh:mm').format(attendanceTime!);
          return Right(newTime);
        },
      );
  }
}
