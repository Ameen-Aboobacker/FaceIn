import 'package:dartz/dartz.dart';

import '../../domain/failures/failures.dart';

class TemplateDataSource {
  TemplateDataSource();
  Future<Either<Failure, Unit>> indexSFace() async {
    try {
      String a = 'AMEE';
      String? b;
      final res = await Future.delayed(const Duration(seconds: 1), () {
        b = a;
        return b;
      });
      if (res != null) {
        return const Right(unit);
      } else {
        return const Left(Failure.rekognition('rek failed'));
      }
    } catch (e) {
      return Left(Failure.rekognition(e.toString()));
    }
  }

  static Future<Either<Failure, Unit>> scansSFace() async {
    try {
      String? a;
      String? b;
      final res = await Future.delayed(const Duration(seconds: 1), () {
        b = a;
        return b;
      });
      if (res != null) {
        return const Right(unit);
      } else {
        return const Left(Failure.rekognition('rek failed'));
      }
    } catch (e) {
      return Left(Failure.rekognition(e.toString()));
    }
  }
}
