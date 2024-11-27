import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key, required this.controller});
  final CameraController controller;

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? image;

  Timer? timer;
  @override
  void initState() {
    super.initState();

    timer = Timer(const Duration(milliseconds: 5500), () async {
      final navigator = Navigator.of(context);
      final scaffoldMessenger = ScaffoldMessenger.of(context);

      log('hi');

      final file = await widget.controller.takePicture();
      File image = File(file.path);

      scaffoldMessenger.showSnackBar(
        customSnackbar(
          content: const Text('Picture Captured'),
        ),
      );
      navigator.pop(image);
    });
  }

  @override
  void dispose() async {
    super.dispose();
    log('DISPOSED');
    await widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green.shade700,
                      width: 1.5,
                    ),
                  ),
                  child: CameraPreview(widget.controller)),
              const SizedBox(height: 20),
              const Center(child: Counter())
            ],
          ),
        ),
      ),
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
