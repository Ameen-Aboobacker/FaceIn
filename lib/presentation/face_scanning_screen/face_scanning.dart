import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:facein/application/face_scanning_bloc/face_scanning_bloc.dart';
import 'package:facein/domain/entities/verify_model.dart';
import 'package:facein/domain/failures/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/camera_controllers.dart';

class FaceScanning extends StatelessWidget {
  const FaceScanning({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FaceScanningBloc>().add(SampleScan());
    return BlocConsumer<FaceScanningBloc, FaceScanningState>(
      listener: (context, state) {
        if (state is ScanningSuccess) {
          log(state.verifyModel.toString());
          ScaffoldMessenger.of(context).showSnackBar(
              verificationBar(verificationData: state.verifyModel));
        } else if (state is ScanningFailed) {
          if (state.failure is RekognitionFailure) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                final nav = Navigator.of(context);
                Future.delayed(const Duration(seconds: 3), () {
                  nav.pop(); // Close the dialog and return a value
                });
                return AlertDialog(
                  backgroundColor: Colors.white,
                  icon: const Icon(Icons.close),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(8)),
                  title: const Text('Rekognition Failure'),
                  titleTextStyle: const TextStyle(fontSize: 22, color: Colors.black),
                  content: Text(state.failure.message),
                );
              },
            );
          } else {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                final nav = Navigator.of(context);
                Future.delayed(const Duration(seconds: 3), () {
                  nav.pop(); // Close the dialog and return a value
                });
                return AlertDialog(
                  title: const Text('Failed'),
                  content: Text(state.failure.message),
                );
              },
            );
          }
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

SnackBar verificationBar({
  required VerifyModel verificationData,
}) {
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
            backgroundImage: verificationData.employee.imageUrl,
          ),
          const SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Verification is\nSuccessfull',
                style: TextStyle(color: color2, fontSize: 20),
              ),
              Text(verificationData.date,
                  style: const TextStyle(color: color1, fontSize: 13)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.person),
                  Text(verificationData.employee.name,
                      style: const TextStyle(color: color1)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.admin_panel_settings_outlined),
                  Text(verificationData.employee.id,
                      style: const TextStyle(color: color1)),
                ],
              ),
            ],
          )
        ],
      ));
}
