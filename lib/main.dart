import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:facein/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'application/employee_registration_bloc/employee_registration_bloc.dart';
import 'application/face_scanning_bloc/face_scanning_bloc.dart';
import 'core/camera_controllers.dart';

import 'presentation/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  cameras = await availableCameras();
  log(cameras.length.toString());
  await captureController.initialize();
  await scanningController.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavigationCubit()),
        BlocProvider(create: (context) => EmployeeRegistrationBloc()),
        BlocProvider(create: (context) => FaceScanningBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FaceIn',
        theme: ThemeData(),
        home: const AnimatedScaffold(),
      ),
    );
  }
}
