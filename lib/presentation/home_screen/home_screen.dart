import 'package:flutter/material.dart';

import 'widgets/custom_bottom_bar.dart';
import '../employee_details_screen/employees_screen.dart';
import '../employee_registration_screen/employee_registration.dart';
import '../face_scanning_screen/face_scanning.dart';

ValueNotifier<int> indexNotifier = ValueNotifier(0);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List pages = const [
      EmployeeRegistration(),
      FaceScanning(),
      EmployeesScreen(),
    ];

    return ValueListenableBuilder(
      valueListenable: indexNotifier,
      builder: (context, int index, _) {
        return Scaffold(
          body: pages[index],
          backgroundColor: Colors.white,
          bottomNavigationBar: CustomBar(currentIndex: index),
        );
      },
    );
  }
}
