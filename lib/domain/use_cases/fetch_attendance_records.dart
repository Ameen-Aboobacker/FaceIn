import 'package:dartz/dartz.dart';
import 'package:facein/domain/repositories/attendance_repository.dart';

import '../entities/attendance_model.dart';
import '../failures/failures.dart';

class FetchAttendanceUsecase {
  final AttendanceRepository attendanceRepository;
  FetchAttendanceUsecase(this.attendanceRepository);
  Future<Either<Failure, List<Attendance>>> call(String employeeId, String date) async {
    final res = await attendanceRepository.fetchAttendance(employeeId, date);
    return res.fold(
      (fail) => Left(fail),
      (succes) => Right(succes),
    );
  }
}
