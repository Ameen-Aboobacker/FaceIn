import 'package:flutter/material.dart';

import '../../data/employee_model.dart';
import 'widgets/employee_details_widget.dart';
import 'widgets/employee_list_widget.dart';

class EmployeesScreen extends StatefulWidget {
const EmployeesScreen({ super.key });

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  bool isClicked = false;

  Employee? selectedEmployee;

  @override
  Widget build(BuildContext context) {
    Color primarycolor = const Color.fromARGB(255, 16, 134, 24);
    Color secondary = Colors.white;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: primarycolor,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Employee Details'),
      ),
      backgroundColor: secondary,
      body: SafeArea(
        child: isClicked
            ? EmployeeDetailsWidget(
                selectedEmployee: selectedEmployee,
                onPressed: () {
                  setState(() {
                    selectedEmployee = null;
                    isClicked = false;
                  });
                },
              )
            : EmployeeListWidget(
                onTap: (Employee employee) {
                  setState(() {
                    isClicked = true;
                    selectedEmployee = employee;
                  });
                },
                secondary: secondary,
                primarycolor: primarycolor,
              ),
      ),
    );
  }
}