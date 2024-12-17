import 'dart:io';

import 'package:dartz/dartz.dart';

import '../failures/failures.dart';

abstract interface class FaceRekognitionRepository {
  Future<Either<Failure,String>> indexFace(File photo);
  Future<Either<Failure, String>> verifyFace(File photo);
}
