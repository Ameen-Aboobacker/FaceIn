import 'dart:io';

import '../entities/employee_model.dart';
import 'index_face.dart';
import 'save_details.dart';
import 'upload_photo.dart';

class RegisterEmployee {
  final UploadPhoto uploadPhoto;
  final IndexFace indexFace;
  final SaveEmployeeDetails saveEmployeeDetails;

  RegisterEmployee(this.uploadPhoto, this.indexFace, this.saveEmployeeDetails);

  Future<void> call(Employee employee, File photo) async {
    final uploadPhotoFuture = uploadPhoto(photo);
    final indexFaceFuture = indexFace(photo);

    final imageUrl = await uploadPhotoFuture;
    final faceId = await indexFaceFuture;

    await saveEmployeeDetails(
      employee.copyWith(imageUrl: imageUrl, faceId: faceId),
    );
  }
}
