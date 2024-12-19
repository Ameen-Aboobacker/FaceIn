import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facein/data/data_sources/fireabse_data_source.dart';
import 'package:facein/data/data_sources/template_data_source.dart';
import 'package:facein/data/repositories/employee_repository_impl.dart';
import 'package:facein/domain/use_cases/register_employee.dart';
import 'package:facein/domain/use_cases/save_details.dart';
import 'package:facein/domain/use_cases/verify_face.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../core/aws_constants.dart';
import '../data/data_sources/aws_rekognition_data_source.dart';
import '../data/repositories/attendance_repository_impl.dart';
import '../data/repositories/face_rekognition_repository_impl.dart';
import 'repositories/employee_repository.dart';
import 'use_cases/index_face.dart';
import 'use_cases/upload_photo.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseStorage storage = FirebaseStorage.instance;

//data_source
FirebaseDataSource firebaseDataSource = FirebaseDataSource(storage, firestore);
AwsRekognitionDataSource awsRekognitionDataSource =
    AwsRekognitionDataSource(rekognition);
TemplateDataSource templateDataSource = TemplateDataSource();
//Repositories
EmployeeRepository employeeRepository =
    EmployeeRepositoryImpl(firebaseDataSource);
final faceRekognitionRepository =
    FaceRekognitionRepositoryImpl(awsRekognitionDataSource);
final attendanceRepository = AttendanceRepositoryImpl(firebaseDataSource);
//use_cases
final uploadPhoto = UploadPhoto(employeeRepository);
final indexFace = IndexFace(faceRekognitionRepository);
final saveEmployeeDetails = SaveEmployeeDetails(employeeRepository);
final registerEmployee = RegisterEmployee(
  uploadPhoto,
  indexFace,
  saveEmployeeDetails,
);
final verifyFace = VerifyFace(
  employeeRepository,
  faceRekognitionRepository,
  attendanceRepository,
);
