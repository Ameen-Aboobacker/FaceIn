import 'package:dartz/dartz.dart';

import '../../domain/failures/failures.dart';

class TemplateDataSource {
  TemplateDataSource();
  Future<Either<Failure, Unit>> indexSFace() async {
    try {
      String a = 'AMEEN';

      if (a == 'AMEEN') {
        return const Right(unit);
      } else {
        return const Left(Failure.rekognition('rek failed'));
      }
    } catch (e) {
      return Left(Failure.rekognition(e.toString()));
    }
  }
}
