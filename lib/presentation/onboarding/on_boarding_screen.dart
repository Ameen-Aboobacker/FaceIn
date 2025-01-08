import 'package:facein/application/bloc/employee_fetch_bloc.dart';
import 'package:facein/presentation/employee_details_screen/employees_screen.dart';
import 'package:facein/presentation/employee_registration_screen/employee_registration.dart';
import 'package:facein/presentation/face_scanning_screen/face_scanning.dart';
import 'package:facein/presentation/onboarding/widgets/dashboard_item.dart';
//import 'package:facein/presentation/sample_screen.dart';
import 'package:facein/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../sample_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Face Scanning Widget (Primary)
            Expanded(
              flex: 2,
              child: DashboardItem(
                titleSize: 22,
                iconSize: 60,
                fontWeight: FontWeight.bold,
                onTap: () {
                  Navigator.push(
                    context,
                    CustomPageRoute(
                      page: const FaceScanning(),
                    ),
                  );
                },
                color: const Color(0xFF283593),
                icon: Icons.face,
                title: 'Face Scanning',
              ),
            ),
            const SizedBox(height: 45),

            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: DashboardItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          CustomPageRoute(
                            page: const EmployeeRegistration(),
                          ),
                        );
                      },
                      color: Colors.green,
                      icon: Icons.import_contacts,
                      title: 'Employee Registration',
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Employee Info Widget
                  Expanded(
                      child: DashboardItem(
                    onTap: () {
                      context.read<EmployeeFetchBloc>().add(FetchEmployees());
                      Navigator.push(
                        context,
                        CustomPageRoute(
                          page: const SampleScreen(),
                        ),
                      );
                    },
                    color: Colors.orange,
                    icon: Icons.info,
                    title: 'Employee Info',
                  )),

                  //new
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
