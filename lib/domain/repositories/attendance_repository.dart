import '../entities/attendance_model.dart';

abstract interface class AttendanceRepository {
  Future<void> markAttendance(String employeeId);

  Future<List<Attendance>> fetchAttendance(String employeeId);
}
