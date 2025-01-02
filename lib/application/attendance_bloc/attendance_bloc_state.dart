part of 'attendance_bloc_bloc.dart';

@immutable
sealed class AttendanceBlocState {}

final class AttendanceInit extends AttendanceBlocState {}

final class AttendanceSuccess extends AttendanceBlocState {
  final List<Attendance> attendance;
  AttendanceSuccess(this.attendance);
}

final class AttendanceFail extends AttendanceBlocState {
  final String error;
  AttendanceFail(this.error);
}
