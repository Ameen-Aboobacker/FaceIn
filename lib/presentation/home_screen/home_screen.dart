import 'package:facein/presentation/sample_screen.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_bottom_bar.dart';
import '../employee_registration_screen/employee_registration.dart';
import '../face_scanning_screen/face_scanning.dart';

ValueNotifier<int> indexNotifier = ValueNotifier(1);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List pages = const [
      EmployeeRegistration(),
      FaceScanning(),
      //EmployeesScreen(),
      SampleScreen()
    ];

    return ValueListenableBuilder(
      valueListenable: indexNotifier,
      builder: (context, state, _) {
        return Scaffold(
          body: pages[state],
          backgroundColor: Colors.white,
          bottomNavigationBar: CustomBar(currentIndex: state),
        );
      },
    );
  }
}
