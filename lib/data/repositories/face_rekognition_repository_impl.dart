import 'dart:io';

import 'package:facein/data/data_sources/aws_rekognition_data_source.dart';

import '../../domain/repositories/face_rekognition_repository.dart';

class FaceRekognitionRepositoryImpl implements FaceRekognitionRepository {
  final AwsRekognitionDataSource awsRekognitionDataSource;

  FaceRekognitionRepositoryImpl(this.awsRekognitionDataSource);
  @override
  Future<String?> indexFace(File photo) {
    return awsRekognitionDataSource.indexFace(photo);
  }

  @override
  Future<String?> verifyFace(File photo) {
    return awsRekognitionDataSource.compareFace(photo);
  }
}
