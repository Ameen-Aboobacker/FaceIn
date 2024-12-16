import 'package:facein/domain/entities/attendance_model.dart';
import 'package:facein/domain/repositories/attendance_repository.dart';

import '../data_sources/fireabse_data_source.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final FirebaseDataSource firebaseDataSource;

  AttendanceRepositoryImpl(this.firebaseDataSource);

  @override
  Future<void> markAttendance(
      String employeeId) {
    return firebaseDataSource.markAttendance(employeeId);
  }

  @override
  Future<List<Attendance>> fetchAttendance(String employeeId) {
    return firebaseDataSource.fetchAttendance(employeeId);
  }
}
