import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceReportScreen extends StatefulWidget {
  const AttendanceReportScreen({super.key});

  @override
  State<AttendanceReportScreen> createState() => _AttendanceReportScreenState();
}

class _AttendanceReportScreenState extends State<AttendanceReportScreen>
    with TickerProviderStateMixin {
  Map? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              final date = DateFormat('dd/MM/yyyy').format(value);
              setState(() {
                data = report[date];
                log(data.toString());
              });
            },
          ),
          const SizedBox(height: 15),
          data == null
              ? const SizedBox()
              : Text('Check in :${data!['check in']}'),
        ],
      ),
    );
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
