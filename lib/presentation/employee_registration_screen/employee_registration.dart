
import 'package:facein/application/capture_image_cubit/capture_image_cubit.dart';
import 'package:facein/core/camera_controllers.dart';
import 'package:facein/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'camera_screen.dart';
import 'widgets/employee_registration_consumer.dart';

class EmployeeRegistration extends StatelessWidget {
  const EmployeeRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        context.read<CaptureImageCubit>().changeState();
        imageFieldNotifier.value = false;
      },   
      child: Scaffold(
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
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          onCapture: () async {
            final scaffoldMessenger = ScaffoldMessenger.of(context);
            final nav = Navigator.of(context);
            await captureController.initialize();
            scaffoldMessenger.showSnackBar(
              customSnackbar(
                content: const Text('Wait for 5 seconds'),
              ),
            );
            await nav.push(
              MaterialPageRoute(
                builder: (context) => const CameraScreen(),
              ),
            );
          },
        ),
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
