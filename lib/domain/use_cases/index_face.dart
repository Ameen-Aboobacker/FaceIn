import 'dart:io';

import '../repositories/face_rekognition_repository.dart';

class IndexFace {
  final FaceRekognitionRepository faceRecognitionRepository;

  IndexFace(this.faceRecognitionRepository);

  Future<String?> call(File photo) async {
    return await faceRecognitionRepository.indexFace(photo);
  }
}
