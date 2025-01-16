import 'dart:io';
import 'dart:typed_data';

import 'package:aws_rekognition_api/rekognition-2016-06-27.dart';
import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';
import 'package:facein/domain/failures/failures.dart';

class AwsRekognitionDataSource {
  Rekognition rekognition;

  AwsRekognitionDataSource(this.rekognition);

  Future<Either<Failure, String>> indexFace(XFile photo) async {
    Uint8List imageBytes = await photo.readAsBytes();
    try {
      final response = await rekognition.indexFaces(
        collectionId: 'employee_faces',
        image: Image(bytes: imageBytes),
      );
      final records = response.faceRecords;
      if (records != null && records.isNotEmpty) {
        return Right(records[0].face!.faceId!);
      } else {
        return const Left(Failure.rekognition("Face indexing failed."));
      }
    } on InvalidParameterException catch (e) {
      return Left(Failure.rekognition(e.message ?? e.code));
    }
  }

  Future<Either<Failure, String>> compareFace(File photo) async {
    Uint8List imageBytes = await photo.readAsBytes();
    try {
      final response = await rekognition.searchFacesByImage(
        collectionId: 'employee_faces',
        image: Image(bytes: imageBytes),
        maxFaces: 1,
      );
      final records = response.faceMatches;
      if (records != null && records.isNotEmpty) {
        return Right(records.first.face!.faceId!);
      } else {
        return const Left(Failure.rekognition('No matching faces FOUND'));
      }
    } on InvalidParameterException catch (e) {
      return Left(Failure.rekognition('${e.type} : ${e.message}'));
    } catch (e) {
      return Left(Failure.rekognition('$e'));
    }
  }
}
