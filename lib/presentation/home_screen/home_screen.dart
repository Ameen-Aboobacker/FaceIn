import 'package:facein/application/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    return BlocBuilder<BottomNavigationCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: pages[state],
          backgroundColor: Colors.white,
          bottomNavigationBar: CustomBar(currentIndex: state),
        );
      },
    );
  }
}
