part of 'employee_fetch_bloc.dart';

@immutable
sealed class EmployeeFetchEvent {}

final class FetchEmployees extends EmployeeFetchEvent{}