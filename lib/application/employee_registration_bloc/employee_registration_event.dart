part of 'employee_registration_bloc.dart';

@immutable
sealed class EmployeeRegistrationEvent {}

final class Registration extends EmployeeRegistrationEvent {
  final Employee employee;
  final XFile? image;
  Registration({required this.employee, required this.image});
}

final class SampleRegEvent extends EmployeeRegistrationEvent {}
