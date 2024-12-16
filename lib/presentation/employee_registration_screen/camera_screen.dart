import 'dart:async';


import 'package:camera/camera.dart';
import 'package:facein/application/capture_image_cubit/capture_image_cubit.dart';
import 'package:facein/core/camera_controllers.dart';
import 'package:facein/presentation/employee_registration_screen/employee_registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () async {
      await context.read<CaptureImageCubit>().captureImage();
    });
    return BlocConsumer<CaptureImageCubit, CaptureImageState>(
      listener: (context, state) {
        if (state is ImageCaptured) {
          ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(content: 'captured:${state.image.name}'));
              Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green.shade700,
                      width: 1.5,
                    ),
                  ),
                  child: CameraPreview(
                    captureController,
                    child: const Center(child: Counter()),
                  )),
            ),
          ),
        );
      },
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({
    super.key,
  });
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  Duration _remainingTime = const Duration(seconds: 5);

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime -= const Duration(seconds: 1);
        } else {
          timer.cancel(); // Stop the timer when time's up
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _remainingTime.inSeconds == 0
        ? const Text('')
        : Text(
            _remainingTime.inSeconds.toString(),
            style: const TextStyle(
                fontSize: 110,
                fontWeight: FontWeight.w300,
                color: Colors.white),
          );
  }
}

SnackBar customSnackbar({required Widget content}) {
  return SnackBar(
    content: content,
    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    shape: const RoundedRectangleBorder(),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(milliseconds: 1500),
  );
}
