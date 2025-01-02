part of 'attendance_bloc_bloc.dart';

@immutable
sealed class AttendanceBlocEvent {}

final class FetchAttendance extends AttendanceBlocEvent {
  final String id;
  final String date;
  FetchAttendance(this.id, this.date);
}
