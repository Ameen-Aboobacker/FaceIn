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
    context.read<FaceScanningBloc>().add(ScanningFace());
    return BlocConsumer<FaceScanningBloc, FaceScanningState>(
      listener: (context, state) {
        if (state is ScanningSuccess) {
          log(state.verifyModel.toString());
          ScaffoldMessenger.of(context).showSnackBar(
              verificationBar(verificationData: state.verifyModel));
        } else if (state is ScanningFailed) {
          if (state.failure is RekognitionFailure ||
              state.failure is FirestoreFailure) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                final nav = Navigator.of(context);
                Future.delayed(const Duration(seconds: 2), () {
                  nav.pop(); // Close the dialog and return a value
                });
                return AlertDialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.circular(12)),
                  title: const Text('Verification Failed'),
                  titleTextStyle:
                      const TextStyle(fontSize: 22, color: Colors.black),
                  content: Text(
                    'Employee Not Found.Check with admin or Try again later.',
                  ),
                );
              },
            );
          } else {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                final nav = Navigator.of(context);
                Future.delayed(const Duration(seconds: 2), () {
                  nav.pop();
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
  final image = verificationData.getProfileImage();
  const Color color1 = Colors.black;
  return SnackBar(
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.green.shade600, width: 2),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
    ),
    duration: const Duration(seconds: 5),
    backgroundColor: Colors.white,
    margin: const EdgeInsets.only(bottom: 150, left: 20, right: 20),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    behavior: SnackBarBehavior.floating,
    content: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 85,
          width: 85,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.green.shade600, width: 2),

            // border: Border.all()
          ),
          child: image,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Verification Successfull',
                    style: TextStyle(
                        height: 1.1,
                        color: Colors.green.shade700,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    verificationData.time ?? '',
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.person),
                      Text(
                        verificationData.name,
                        style: const TextStyle(color: color1, fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.admin_panel_settings_outlined),
                      Text(verificationData.id,
                          style: const TextStyle(color: color1, fontSize: 14)),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
