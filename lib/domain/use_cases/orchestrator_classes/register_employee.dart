
import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';

import '../../entities/employee_model.dart';
import '../../failures/failures.dart';
import '../index_face.dart';
import '../save_details.dart';
import '../upload_photo.dart';

class RegisterEmployee {
  final UploadPhoto uploadPhoto;
  final IndexFace indexFace;
  final SaveEmployeeDetails saveEmployeeDetails;

  RegisterEmployee(this.uploadPhoto, this.indexFace, this.saveEmployeeDetails);

  Future<Either<Failure, Unit>> call(Employee employee, XFile photo) async {
    final imageUrlResult = await uploadPhoto(photo, employee.id);
    final faceIdResult = await indexFace(photo);

    return imageUrlResult.fold(
      (failure) => Left(failure),
      (imageUrl) {
        return faceIdResult.fold(
          (failure) => Left(failure),
          (faceId) async {
            final saveResult = await saveEmployeeDetails(
              employee.copyWith(imageUrl: imageUrl, faceId: faceId),
            );
            return saveResult.fold(
              (failure) => Left(failure),
              (successMessage) => const Right(unit),
            );
          },
        );
      },
    );
  }
}
