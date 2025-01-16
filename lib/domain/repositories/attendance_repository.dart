import 'package:dartz/dartz.dart';

import '../entities/attendance_model.dart';
import '../failures/failures.dart';

abstract interface class AttendanceRepository {
   Future<Either<Failure,Enum>>  markAttendance(String employeeId,DateTime date);

  Future<Either<Failure, List<Attendance>>> fetchAttendance(
      String employeeId, String date);
}
