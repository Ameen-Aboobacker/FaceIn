import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/capture_image_cubit/capture_image_cubit.dart';
import '../../../application/employee_registration_bloc/employee_registration_bloc.dart';

import '../../../core/utils.dart/helper.dart';

import '../../widgets/submit_button_widget.dart';

import 'take_photo_widget.dart';

class EmployeeRegistrationBlocConsumer extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final VoidCallback onCapture;
  final VoidCallback onTap;
  EmployeeRegistrationBlocConsumer({
    super.key,
    required this.onCapture,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeeRegistrationBloc, EmployeeRegistrationState>(
      listener: (contxt, state) {
        if (state is RegistrationLoading) {
          clearTextFields();
        }
        if (state is RegistrationSuccess) {
          log(state.employee.toJson().toString());

          _showDialog(
            context,
            title: 'Success',
            content: 'Employee data stored successfully',
          );
        } else if (state is RegistrationFailure) {
          _showDialog(
            context,
            title: 'Failed!',
            content: 'Employee data storing failed: ${state.error}',
          );
        }
      },
      builder: (contxt, state) {
        return GestureDetector(
          onTap: () {
            log('ss]b');

            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  TakePhotoWidget(onTake: onCapture),
                  const SizedBox(height: 20),
                  Helper.buildTextField(
                      'Name', TextInputType.text, nameController),
                  Helper.buildTextField(
                      'Designation', TextInputType.text, idController),
                  Helper.buildTextField(
                      'Email', TextInputType.emailAddress, emailController),
                  Helper.buildTextField(
                      'Contact', TextInputType.number, phoneController),
                  const SizedBox(height: 20),
                  state is RegistrationLoading
                      ? const CircularProgressIndicator()
                      : SubmitButtonWidget(
                          onPressed: () {
                            final name = nameController.text.trim();
                            final des = idController.text.trim();
                            final email = emailController.text.trim();
                            final contact = phoneController.text.trim();
                            final image =
                                context.read<CaptureImageCubit>().image;

                            Helper.handleSubmit(
                              context,
                              name: name,
                              des: des,
                              email: email,
                              contact: contact,
                              image: image,
                            );
                          },
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showDialog(BuildContext context,
      {required String title, required String content}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          final nav = Navigator.of(context);
          Future.delayed(const Duration(seconds: 1), () {
            log('pop1');
            nav.pop();
          });
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  void clearTextFields() {
    nameController.clear();
    idController.clear();
    emailController.clear();
    phoneController.clear();
  }
}
