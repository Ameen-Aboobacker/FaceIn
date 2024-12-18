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
        decoration: InputDecoration(
          prefixText: contact ? '+91' : null,
          prefixStyle:
              const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          labelStyle: const TextStyle(color: AppColors.primaryColor),
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
