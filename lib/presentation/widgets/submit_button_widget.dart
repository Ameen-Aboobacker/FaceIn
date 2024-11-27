import 'package:facein/core/colors.dart';
import 'package:flutter/material.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              fixedSize: const Size(130, 40),
              side: const BorderSide(color: AppColors.primaryColor),
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
            ),
            onPressed: onPressed,
            child: const Text('Save')),
      ],
    );
  }
}
