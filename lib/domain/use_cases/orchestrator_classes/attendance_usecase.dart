import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:facein/domain/entities/verify_model.dart';
import 'package:facein/domain/failures/failures.dart';
import 'package:facein/domain/use_cases/fetch_employee.dart';
import 'package:facein/domain/use_cases/verify_face.dart';
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
        final time = await markAttendance(success.id);

        return time.fold(
          (fail) {
            log(fail.toString());
            return Left(fail);
          },
          (attendanceTime) {
            return Right(VerifyModel(success, attendanceTime));
          },
        );
      });
    });
  }
}
