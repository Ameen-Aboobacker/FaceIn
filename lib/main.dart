import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:facein/application/attendance_bloc/attendance_bloc_bloc.dart';
import 'package:facein/application/bloc/employee_fetch_bloc.dart';

import 'package:facein/application/capture_image_cubit/capture_image_cubit.dart';

import 'package:facein/domain/dpendencey_injection.dart';

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
  await Firebase.initializeApp();
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
        BlocProvider(
          create: (context) => BottomNavigationCubit(),
        ),
        BlocProvider(
          create: (context) => EmployeeRegistrationBloc(registerEmployee),
        ),
        BlocProvider(
          create: (context) => FaceScanningBloc(attendanceUsecase),
        ),
        BlocProvider(
          create: (context) => CaptureImageCubit(),
        ),
        BlocProvider(
          create: (context) => AttendanceBlocBloc(fetchAttendance),
        ),
        BlocProvider(
          create: (context) => EmployeeFetchBloc(fetchAllEmployee),
        ),
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
