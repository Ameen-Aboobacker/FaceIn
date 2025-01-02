import 'package:dartz/dartz.dart';
import 'package:facein/domain/entities/attendance_model.dart';
import 'package:facein/domain/failures/failures.dart';
import 'package:facein/domain/repositories/attendance_repository.dart';

import '../data_sources/fireabse_data_source.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final FirebaseDataSource firebaseDataSource;

  AttendanceRepositoryImpl(this.firebaseDataSource);

  @override
  Future<Either<Failure,DateTime?>>  markAttendance(String employeeId) {
    return firebaseDataSource.markAttendance(employeeId);
  }

  @override
  Future<Either<Failure, List<Attendance>>> fetchAttendance(
      String employeeId, String date) async {
    return firebaseDataSource.fetchAttendance(employeeId, date);
  }
}
