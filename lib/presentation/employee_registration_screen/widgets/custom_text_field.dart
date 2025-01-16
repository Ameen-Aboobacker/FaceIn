import 'package:facein/core/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.keyboardType,
    required this.controller,
    required this.label,
    this.contact = false,
  });

  final TextInputType keyboardType;
  final TextEditingController controller;
  final String label;
  final bool contact;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Field required';
          } else if (label == 'Name' && value.length < 3) {
            return 'Enter a Valid name';
          } else if (label == 'Designation' && value.length < 3) {
            return 'Enter a Valid designation';
          } else if (label == 'Email' && value.length < 3) {
            return 'Enter a Valid mail';
          } else if (label == 'Contact' && value.length != 10) {
            return 'Enter a Valid Contact number';
          }
          return null;
        },
        decoration: InputDecoration(
          prefixText: contact ? '+91' : null,
          prefixStyle:
              const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          labelStyle: const TextStyle(color: AppColors.primaryColor),
          errorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.primaryColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          label: Text(label),
        ),
      ),
    );
  }
}
