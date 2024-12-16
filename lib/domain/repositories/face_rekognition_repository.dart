import 'dart:io';

abstract interface class FaceRekognitionRepository {
  Future<String?> indexFace(File photo);
  Future<String?> verifyFace(File photo);
}
