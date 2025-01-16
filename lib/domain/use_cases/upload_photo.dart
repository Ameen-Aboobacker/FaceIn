import 'dart:developer';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';

import '../failures/failures.dart';
import '../repositories/employee_repository.dart';

class UploadPhoto {
  final EmployeeRepository employeeRepository;

  UploadPhoto(this.employeeRepository);

  Future<Either<Failure, String>> call(XFile photo, String path) async {
    final resizedphoto = await resizeImageWithImagePackage(photo, 600, 600);
    return await employeeRepository.uploadPhoto(resizedphoto, path);
  }
}

Future<File> resizeImageWithImagePackage(
    XFile file, int width, int height) async {
  final bytes = await file.readAsBytes();
  final image = img.decodeImage(bytes);
  final resizedImage = img.copyResize(image!, width: width, height: height);
  final rfile = img.encodeJpg(resizedImage);
  log('sss');
  final tempFile = File(file.path);
  final rrfile = await tempFile.writeAsBytes(rfile);
  return rrfile;
}
