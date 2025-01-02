part of 'employee_registration_bloc.dart';

@immutable
sealed class EmployeeRegistrationState {}

final class RegistrationInitial extends EmployeeRegistrationState {}

final class RegistrationLoading extends EmployeeRegistrationState {}

final class RegistrationFailure extends EmployeeRegistrationState {
  final Failure error;
  RegistrationFailure({required this.error});
}

final class IndexFaceSuccess extends EmployeeRegistrationState {}

final class ImageUploadSuccess extends EmployeeRegistrationState {}

final class RegistrationSuccess extends EmployeeRegistrationState {
  final Employee employee;
  RegistrationSuccess(this.employee);
}
