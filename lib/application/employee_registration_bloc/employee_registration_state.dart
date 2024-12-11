part of 'employee_registration_bloc.dart';

@immutable
sealed class EmployeeRegistrationState {}

final class RegistrationInitial extends EmployeeRegistrationState {}

final class RegistrationLoading extends EmployeeRegistrationState {}

final class RegistrationFailed extends EmployeeRegistrationState {
  final String error;
  RegistrationFailed({required this.error});
}

final class RegistrationSuccess extends EmployeeRegistrationState {}
