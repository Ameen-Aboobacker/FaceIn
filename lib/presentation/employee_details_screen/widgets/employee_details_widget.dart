import 'package:flutter/material.dart';

import '../../../domain/entities/employee_model.dart';
import '../../attendance_report_screen/attendance_report_screen.dart';
import 'custom_text.dart';

class EmployeeDetailsWidget extends StatelessWidget {
  const EmployeeDetailsWidget({
    super.key,
    required this.selectedEmployee,
    required this.onPressed,
  });

  final Employee selectedEmployee;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(30, 25, 25, 0),
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 40),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 183, 196, 184),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.green, width: 2),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    iconSize: 28,
                    onPressed: onPressed,
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   CircleAvatar(
                    radius: 110,
                    backgroundImage: selectedEmployee.imageUrl,
                  ),
                  const SizedBox(height: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(label: selectedEmployee.name),
                      const SizedBox(height: 13),
                      CustomText(label: 'ID:${selectedEmployee.id}'),
                      const SizedBox(height: 13),
                      CustomText(label: '${selectedEmployee.designation}'),
                      const SizedBox(height: 13),
                      CustomText(label: selectedEmployee.email),
                      const SizedBox(height: 13),
                      CustomText(label: selectedEmployee.contact),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton.icon(
              iconAlignment: IconAlignment.end,
              label: Text(
                'Attendance Report',
                style: TextStyle(
                  color: Colors.green.shade800,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 17,
                color: Colors.green.shade800,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AttendanceReportScreen(
                      employee: selectedEmployee,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(width: 15),
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
/* InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Report(),
                ));
              },
              child: Row(
                children: [
                  Text(
                    'Attendance Report',
                    style: TextStyle(
                        color: Colors.green.shade800,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 2),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 19,
                    color: Colors.green.shade800,
                  )
                ],
              ),
            ), */