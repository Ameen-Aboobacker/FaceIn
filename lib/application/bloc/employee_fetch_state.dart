part of 'employee_fetch_bloc.dart';

@immutable
sealed class EmployeeFetchState {}

final class Initial extends EmployeeFetchState {}

final class FetchSuccess extends EmployeeFetchState {
  final List<Employee> employeeList;
  FetchSuccess(this.employeeList);
}

final class FetchLoading extends EmployeeFetchState {}

final class FetchFailed extends EmployeeFetchState {
  final String error;
  FetchFailed(this.error);
}
