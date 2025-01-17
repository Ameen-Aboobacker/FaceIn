import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facein/data/data_sources/fireabse_data_source.dart';
import 'package:facein/data/repositories/employee_repository_impl.dart';
import 'package:facein/domain/use_cases/orchestrator_classes/attendance_usecase.dart';
import 'package:facein/domain/use_cases/fetch_all_employees.dart';
import 'package:facein/domain/use_cases/fetch_attendance_records.dart';
import 'package:facein/domain/use_cases/fetch_employee.dart';
import 'package:facein/domain/use_cases/mark_attendance.dart';
import 'package:facein/domain/use_cases/orchestrator_classes/register_employee.dart';
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
final markAttendance = MarkAttendance(attendanceRepository);
final fetchSingleEmployee = FetchSingleEmployee(employeeRepository);
final verifyFace = VerifyFace(faceRekognitionRepository);
final fetchAttendance = FetchAttendanceUsecase(attendanceRepository);
final fetchAllEmployee = FetchAllEmployees(employeeRepository);

//Orchestrator_classes

final registerEmployee = RegisterEmployee(
  uploadPhoto,
  indexFace,
  saveEmployeeDetails,
);
final attendanceUsecase = AttendanceUsecase(
  fetchSingleEmployee,
  markAttendance,
  verifyFace,
);
