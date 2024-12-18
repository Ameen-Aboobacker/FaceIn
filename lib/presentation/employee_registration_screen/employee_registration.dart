import 'package:facein/core/camera_controllers.dart';
import 'package:facein/core/colors.dart';
import 'package:flutter/material.dart';

import 'camera_screen.dart';
import 'widgets/employee_registration_consumer.dart';

class EmployeeRegistration extends StatelessWidget {
  const EmployeeRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    TextEditingController nameController = TextEditingController();
    TextEditingController idController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primaryColor,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Employee Details'),
      ),
      body: EmployeeRegistrationBlocConsumer(
        formKey: formKey,
        nameController: nameController,
        idController: idController,
        emailController: emailController,
        phoneController: phoneController,
        onCapture: () async {
          final scaffoldMessenger = ScaffoldMessenger.of(context);
          final nav = Navigator.of(context);
          await captureController.initialize();
          scaffoldMessenger.showSnackBar(
              customSnackbar(content: const Text('Wait for 5 seconds')));
          await nav.push(
            MaterialPageRoute(
              builder: (context) => const CameraScreen(),
            ),
          );
        },
      ),
    );
  }
}
SnackBar customSnackBar({required content}) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: const Duration(milliseconds: 800),
    content: Text(
      content,
      style: const TextStyle(fontSize: 18),
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    backgroundColor: AppColors.primaryColor,
    margin: const EdgeInsets.only(bottom: 20, left: 25, right: 25),
  );
}