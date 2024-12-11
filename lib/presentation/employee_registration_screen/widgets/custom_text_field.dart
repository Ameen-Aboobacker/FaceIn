import 'package:facein/core/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.keyboardType,
    required this.nameController,
    required this.label,
  });

  final TextInputType keyboardType;
  final TextEditingController nameController;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: nameController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(25, 16, 20, 16),
        labelStyle: const TextStyle(color: AppColors.primaryColor),
        focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.primaryColor, width: 1),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        label: Text(label),
      ),
       
    );
  }
}
