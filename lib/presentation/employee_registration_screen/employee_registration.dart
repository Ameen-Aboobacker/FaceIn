import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facein/core/camera_controllers.dart';
import 'package:facein/core/colors.dart';
import 'package:flutter/material.dart';

import '../../core/app_sizes.dart';
import '../../data/employee_model.dart';
import '../../domain/funtions.dart';
import '../home_screen/home_screen.dart';
import '../widgets/submit_button_widget.dart';
import 'camera_screen.dart';
import 'widgets/custom_text_field.dart';
import 'widgets/take_photo_widget.dart';

class EmployeeRegistration extends StatefulWidget {
  const EmployeeRegistration({super.key});

  @override
  State<EmployeeRegistration> createState() => _EmployeeRegistrationState();
}

class _EmployeeRegistrationState extends State<EmployeeRegistration> {
  File? image;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    TextEditingController nameController = TextEditingController();
    TextEditingController idController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: const Text('Employee Details'),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  keyboardType: TextInputType.text,
                  nameController: nameController,
                  label: 'Name',
                ),
                AppSizes.kFormHeight,
                CustomTextField(
                  keyboardType: TextInputType.number,
                  nameController: idController,
                  label: 'Employee Id',
                ),
                AppSizes.kFormHeight,
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  nameController: emailController,
                  label: 'Email',
                ),
                AppSizes.kFormHeight,
                CustomTextField(
                  keyboardType: TextInputType.number,
                  nameController: phoneController,
                  label: 'Contact',
                ),
                AppSizes.kFormHeight2,
                TakePhotoWidget(
                  image: image,
                  onTake: () async {
                    final scaffoldMessenger = ScaffoldMessenger.of(context);
                    final nav = Navigator.of(context);

                    scaffoldMessenger.showSnackBar(customSnackbar(
                        content: const Text('Wait for 5 seconds')));
                    final res = await nav.push(
                      MaterialPageRoute(
                        builder: (context) =>
                            CameraScreen(controller: captureController),
                      ),
                    );
                    setState(() {
                      image = res;
                    });
                    log(res.toString());
                  },
                  onRetake: () async {
                    final scaffoldMessenger = ScaffoldMessenger.of(context);
                    final nav = Navigator.of(context);

                    scaffoldMessenger.showSnackBar(customSnackbar(
                        content: const Text('Wait for 5 seconds')));
                    final res = await nav.push(
                      MaterialPageRoute(
                        builder: (context) =>
                            CameraScreen(controller: captureController),
                      ),
                    );
                    setState(() {
                      image = res;
                    });
                    log(res.toString());
                  },
                ),
                SubmitButtonWidget(
                  onPressed: () async {
                    final employee = Employee(
                      name: nameController.text.trim(),
                      employeeId: idController.text.trim(),
                      email: emailController.text.trim(),
                      contact: phoneController.text.trim(),
                      createdAt: Timestamp.fromDate(DateTime.now()),
                    );
                    log(employee.toJson().toString());
                    String res = await addEmployee(employee);
                    log(res);
                    if (res == 'Success') {
                      indexNotifier.value = 2;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
