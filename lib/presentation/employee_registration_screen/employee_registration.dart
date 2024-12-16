import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facein/application/capture_image_cubit/capture_image_cubit.dart';
import 'package:facein/core/camera_controllers.dart';
import 'package:facein/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/employee_registration_bloc/employee_registration_bloc.dart';
import '../../core/app_sizes.dart';
import '../../domain/entities/employee_model.dart';
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
      body: BlocConsumer<EmployeeRegistrationBloc, EmployeeRegistrationState>(
        listener: (context, state) {
          if (state is RegistrationSuccess) {
            log('ssss');
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (cntxt) => AlertDialog(
                title: const Text('Success'),
                content: const Text('Employee data stored successfully'),
                actions: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  )
                ],
              ),
            );
          } else if (state is RegistrationFailure) {
            log(state.error);
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (cntxt) => AlertDialog(
                title: const Text('Failed!'),
                content: Text('Employee data storing failed:${state.error}'),
                actions: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TakePhotoWidget(
                          onTake: () async {
                            final scaffoldMessenger =
                                ScaffoldMessenger.of(context);
                            final nav = Navigator.of(context);
                            await captureController.initialize();
                            scaffoldMessenger.showSnackBar(customSnackbar(
                                content: const Text('Wait for 5 seconds')));
                            await nav.push(
                              MaterialPageRoute(
                                builder: (context) => const CameraScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
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
                        state is RegistrationLoading
                            ? const CircularProgressIndicator()
                            : SubmitButtonWidget(
                                onPressed: () async {
                                  final name = nameController.text.trim();
                                  final eid = idController.text.trim();
                                  final email = emailController.text.trim();
                                  final contact = phoneController.text.trim();
                                  final image =
                                      context.read<CaptureImageCubit>().image;
                                  if (email.isEmpty ||
                                      name.isEmpty ||
                                      eid.isEmpty ||
                                      contact.isEmpty ||
                                      image == null) {
                                    log(image.toString());
                                    SnackBar snackBar = customSnackBar(
                                        content: 'All Fields required');
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else {
                                    final employee = Employee(
                                      name: nameController.text.trim(),
                                      employeeId: idController.text.trim(),
                                      email: emailController.text.trim(),
                                      contact: phoneController.text.trim(),
                                      createdAt:
                                          Timestamp.fromDate(DateTime.now()),
                                    );

                                    context
                                        .read<EmployeeRegistrationBloc>()
                                        .add(
                                          Registration(
                                              employee: employee, image: image),
                                        );
                                  }
                                },
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
