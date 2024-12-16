import 'dart:io';
import 'dart:typed_data';

import 'package:aws_rekognition_api/rekognition-2016-06-27.dart';

class AwsRekognitionDataSource {
  Rekognition rekognition;

  AwsRekognitionDataSource(this.rekognition);

  Future<String> indexFace(File photo) async {
    Uint8List imageBytes = await photo.readAsBytes();
    final response = await rekognition.indexFaces(
      collectionId: 'employee_faces',
      image: Image(bytes: imageBytes),
    );
    final records = response.faceRecords;
    if (records != null && records.isNotEmpty) {
      return records.first.face!.faceId!;
    } else {
      throw Exception("Face indexing failed.");
    }
  }

  Future<String> compareFace(File photo) async {
    Uint8List imageBytes = await photo.readAsBytes();
    final response = await rekognition.searchFacesByImage(
      collectionId: 'employee_faces',
      image: Image(bytes: imageBytes),
    );
    final records = response.faceMatches;
    if (records != null && records.isNotEmpty) {
      return records.first.face!.faceId!;
    } else {
      throw Exception("No Matching Faces found.try again");
    }
  }
}
