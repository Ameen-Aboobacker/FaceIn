import 'dart:developer';

import 'package:facein/core/colors.dart';
import 'package:facein/domain/failures/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../application/capture_image_cubit/capture_image_cubit.dart';
import '../../../application/employee_registration_bloc/employee_registration_bloc.dart';

import '../../../core/utils.dart/helper.dart';

import '../../widgets/submit_button_widget.dart';

import 'take_photo_widget.dart';

ValueNotifier<bool> imageFieldNotifier = ValueNotifier(false);

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
        if (state is RegistrationSuccess) {
          clearTextFields();
          log(state.employee.toJson().toString());

          _showDialog(
            context,
            title: 'Success',
            content: 'Employee data stored successfully',
          );
        } else if (state is RegistrationFailure) {
          clearTextFields();
          String message = state.error.message;
          if (state.error is RekognitionFailure) {
            _showDialog(
              context,
              title: 'Rekognition Failure',
              content: 'Employee data storing failed: $message',
            );
          } else if (state.error is UnexpectedFailure) {
            _showDialog(
              context,
              title: 'unexpected',
              content: 'Employee data storing failed: $message',
            );
          } else {
            _showDialog(
              context,
              title: 'Failed!',
              content: 'Employee data storing failed: $message',
            );
          }
        }
      },
      builder: (contxt, state) {
        return GestureDetector(
          onTap: () {
            log('ssb');

            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  TakePhotoWidget(
                    onTake: onCapture,
                  ),
                  const SizedBox(height: 10),
                  Helper.buildTextField(
                      'Name', TextInputType.text, nameController),
                  Helper.buildTextField(
                      'Designation', TextInputType.text, idController),
                  Helper.buildTextField(
                      'Email', TextInputType.emailAddress, emailController),
                  Helper.buildTextField(
                      'Contact', TextInputType.number, phoneController),
                  const SizedBox(height: 10),
                  state is RegistrationLoading
                      ? const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(110, 0, 110, 20),
                              child: Center(
                                child: LoadingIndicator(
                                    colors: [
                                      AppColors.primaryColor,
                                      Color.fromARGB(255, 140, 169, 220)
                                    ],
                                    strokeWidth: 15,
                                    indicatorType: Indicator.ballRotateChase),
                              ),
                            ),
                            Text('Saving ....')
                          ],
                        )
                      : SubmitButtonWidget(onPressed: () {
                          final image = context.read<CaptureImageCubit>();
                          log(image.checkImage().toString());
                          if (formKey.currentState!.validate() &&
                              image.checkImage()) {
                            Helper.handleSubmit(
                              context,
                              name: nameController.text.trim(),
                              des: idController.text.trim(),
                              email: emailController.text.trim(),
                              contact: phoneController.text.trim(),
                              image: image.image,
                            );
                          } else if (image.checkImage() == false) {
                            log('elseif:${imageFieldNotifier.value.toString()}');
                            imageFieldNotifier.value = true;
                          }
                        }),
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
          Future.delayed(const Duration(seconds: 3), () {
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
