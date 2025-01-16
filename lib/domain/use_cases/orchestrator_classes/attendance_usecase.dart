import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:facein/domain/entities/verify_model.dart';
import 'package:facein/domain/failures/failures.dart';
import 'package:facein/domain/use_cases/fetch_employee.dart';
import 'package:facein/domain/use_cases/verify_face.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import '../mark_attendance.dart';

class AttendanceUsecase {
  final FetchSingleEmployee fetchSingleEmployee;
  final VerifyFace verifyFace;
  final MarkAttendance markAttendance;
  AttendanceUsecase(
    this.fetchSingleEmployee,
    this.markAttendance,
    this.verifyFace,
  );

  Future<Either<Failure, VerifyModel>> call(File photo) async {
    final faceId = await verifyFace(photo);
    log('face:$faceId');
    return faceId.fold((failure) {
      return Left(failure);
    }, (success) async {
      final employee = await fetchSingleEmployee(success);
      log(employee.toString());
      return employee.fold((failure) {
        return Left(failure);
      }, (success) async {
        final punchTime = DateTime.now();
        final newTime = DateFormat('MMMM-dd-yyyy hh:mm').format(punchTime);
        VerifyModel verifyModel = VerifyModel(
          id: success.id,
          name: success.name,
          image: success.imageUrl,
          time: newTime,
        );
        final time = await markAttendance(success.id, punchTime);
        final image = await fetchPhoto(success.imageUrl);
        return time.fold(
          (fail) {
            log(fail.toString());
            return Left(fail);
          },
          (punchType) {
            return image.fold(
              (failure) {
                return Left(failure);
              },
              (success) {
                log(punchType.toString());
                verifyModel = verifyModel.copyWith(
                    punchType: punchType, imageUrl: success);
                return Right(verifyModel);
              },
            );
          },
        );
      });
    });
  }
}

Future<Either<Failure, Uint8List>> fetchPhoto(String path) async {
  final storage = FirebaseStorage.instance;
  final ref = storage.ref().child(path);
  try {
    final task = await ref.getData();

    if (task != null) {
      return Right(task);
    } else {
      return const Left(Failure.firestore('image not available'));
    }
  } catch (e) {
    return Left(Failure.firestore(e.toString()));
  }
}
