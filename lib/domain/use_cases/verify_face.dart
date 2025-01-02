import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:facein/domain/failures/failures.dart';


import '../repositories/face_rekognition_repository.dart';

class VerifyFace {
  final FaceRekognitionRepository faceRekognitionRepository;

  VerifyFace(this.faceRekognitionRepository);

  Future<Either<Failure, String>> call(File photo) async {
    final faceId = await faceRekognitionRepository.verifyFace(photo);
    log('face:$faceId');
    return faceId.fold((failure) {
      return Left(failure);
    }, (success) async {
       return Right(success);
    });
  }
}
