import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/employee_registration_bloc/employee_registration_bloc.dart';
import '../../domain/entities/employee_model.dart';
import '../../presentation/employee_registration_screen/employee_registration.dart';
import '../../presentation/employee_registration_screen/widgets/custom_text_field.dart';
import '../app_sizes.dart';

class Helper {
  static Widget buildTextField(String label, TextInputType keyboardType,
      TextEditingController controller) {
    return Column(
      children: [
        CustomTextField(
          keyboardType: keyboardType,
          controller: controller,
          label: label,
        ),
        AppSizes.kFormHeight,
      ],
    );
  }

  static void handleSubmit(
    BuildContext context, {
    required String name,
    required String des,
    required String email,
    required String contact,
    required XFile? image,
  }) {
    log('sss');
    if ([name, des, email, contact].any((field) => field.isEmpty) ||
        image == null) {
      final snackBar = customSnackBar(content: 'All Fields required');
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final uid = DateTime.now().millisecondsSinceEpoch.toString();
      final id = 'AIT$uid';
      final employee = Employee(
        name: name,
        id: id,
        designation: des,
        email: email,
        contact: contact,
        createdAt: Timestamp.fromDate(DateTime.now()),
      );

      context.read<EmployeeRegistrationBloc>().add(
            Registration(employee: employee, image: image),
          );
    }
  }
}
