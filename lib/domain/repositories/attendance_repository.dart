import 'package:dartz/dartz.dart';

import '../entities/attendance_model.dart';
import '../failures/failures.dart';

abstract interface class AttendanceRepository {
   Future<Either<Failure,DateTime?>>  markAttendance(String employeeId);

  Future<Either<Failure, List<Attendance>>> fetchAttendance(
      String employeeId, String date);
}
