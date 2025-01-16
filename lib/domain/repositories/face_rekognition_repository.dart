import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';

import '../failures/failures.dart';

abstract interface class FaceRekognitionRepository {
  Future<Either<Failure,String>> indexFace(XFile photo);
  Future<Either<Failure, String>> verifyFace(File photo);
}
