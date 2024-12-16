import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:facein/application/face_scanning_bloc/face_scanning_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/camera_controllers.dart';
import '../../domain/entities/employee_model.dart';

class FaceScanning extends StatelessWidget {
  const FaceScanning({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FaceScanningBloc>().add(ScanningFace());
    return BlocConsumer<FaceScanningBloc, FaceScanningState>(
      listener: (context, state) {
        if (state is ScanningSuccess) {
          NetworkImage image = NetworkImage(state.employee.imageUrl);
          log(state.employee.toJson().toString());
          ScaffoldMessenger.of(context).showSnackBar(
              verificationBar(employee: state.employee, image: image));
        } else if (state is ScanningFailed) {
          log("failed :${state.message}");
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: SizedBox(
          height: double.maxFinite,
          child: CameraPreview(scanningController),
        ));
      },
    );
  }
}

SnackBar verificationBar(
    {required Employee employee, required NetworkImage image}) {
  const Color color1 = Colors.black;
  const Color color2 = Color(0xFF206323);
  return SnackBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      backgroundColor: Colors.white,
      margin: const EdgeInsets.only(bottom: 150),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: image,
          ),
          const SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Verification is\nSuccessfull',
                style: TextStyle(color: color2, fontSize: 20),
              ),
              const Text('December 12, 2024 at 4:53 PM ',
                  style: TextStyle(color: color1, fontSize: 13)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.person),
                  Text(employee.name, style: const TextStyle(color: color1)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.admin_panel_settings_outlined),
                  Text(employee.employeeId,
                      style: const TextStyle(color: color1)),
                ],
              ),
            ],
          )
        ],
      ));
}
