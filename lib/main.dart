import 'package:camera/camera.dart';
import 'package:facein/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'presentation/splash_screen/splash_screen.dart';

late List<CameraDescription> cameras;
void main() async {
 
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FaceIn',
      theme: ThemeData(),
      home: const AnimatedScaffold(),
    );
  }
}
