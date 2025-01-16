import 'dart:developer';

import 'package:facein/application/attendance_bloc/attendance_bloc_bloc.dart';
import 'package:facein/domain/entities/employee_model.dart';
import 'package:facein/presentation/employee_registration_screen/employee_registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AttendanceReportScreen extends StatefulWidget {
  const AttendanceReportScreen({super.key, required this.employee});
  final Employee employee;
  @override
  State<AttendanceReportScreen> createState() => _AttendanceReportScreenState();
}

class _AttendanceReportScreenState extends State<AttendanceReportScreen>
    with TickerProviderStateMixin {
  Map? data;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AttendanceBlocBloc, AttendanceBlocState>(
        listener: (context, state) {
          if (state is AttendanceFail) {
            ScaffoldMessenger.of(context)
                .showSnackBar(customSnackBar(content: 'failed:${state.error}'));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('report'),
          ),
          body: Column(
            children: [
              CalendarDatePicker(
                initialDate: null,
                firstDate: DateTime(2001),
                lastDate: DateTime.now(),
                onDateChanged: (value) {
                  final date = DateFormat('dd-MM-yyyy').format(value);
                  log(date);
                  log(widget.employee.id);
                  context
                      .read<AttendanceBlocBloc>()
                      .add(FetchAttendance(widget.employee.id, date));
                },
              ),
              const SizedBox(height: 15),
              Container(
                color: Colors.red,
                child: BlocBuilder<AttendanceBlocBloc, AttendanceBlocState>(
                  builder: (context, state) {
                    if (state is AttendanceSuccess &&
                        state.attendance.isNotEmpty) {
                      final attdata = state.attendance.first;
                      final attendance = attdata.formatAttendance();
                      return Column(
                        children: [
                          Text('Check in : ${attendance['in']}'),
                          Text('Check out : ${attendance['out']}'),
                        ],
                      );
                    }
                    return const SizedBox();
                  },
                ),
              )
            ],
          ),
        ));
  }
}

Map<String, dynamic> report = {
  '01/11/2024': {
    'check in': extractTime(
      DateTime.now().subtract(
        const Duration(days: 6, hours: 2),
      ),
    ),
    'check out': extractTime(
      DateTime.now().subtract(
        const Duration(days: 6),
      ),
    ),
  },
  '02/11/2024': {
    'check in': extractTime(
      DateTime.now().subtract(
        const Duration(days: 5, hours: 2, minutes: 30),
      ),
    ),
    'check out': extractTime(
      DateTime.now().subtract(
        const Duration(days: 5),
      ),
    ),
  },
  '03/11/2024': {
    'check in': extractTime(
      DateTime.now().subtract(
        const Duration(days: 4, hours: 2, minutes: 15),
      ),
    ),
    'check out': extractTime(
      DateTime.now().subtract(
        const Duration(days: 4),
      ),
    ),
  }
};
String extractTime(DateTime date) {
  return DateFormat('hh:mm:ss a').format(date);
}
