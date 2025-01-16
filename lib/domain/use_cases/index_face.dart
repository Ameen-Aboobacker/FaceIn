
import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';

import '../failures/failures.dart';
import '../repositories/face_rekognition_repository.dart';

class IndexFace {
  final FaceRekognitionRepository faceRecognitionRepository;

  IndexFace(this.faceRecognitionRepository);

  Future<Either<Failure,String>> call(XFile photo) async {
    final res = await faceRecognitionRepository.indexFace(photo);
   return res.fold(
      (fail) =>  Left(fail),
      (succes) => Right(succes),
    );
  }
}
