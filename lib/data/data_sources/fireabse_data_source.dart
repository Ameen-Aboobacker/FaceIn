import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/attendance_model.dart';
import '../../domain/entities/employee_model.dart';
import '../../domain/failures/failures.dart';

class FirebaseDataSource {
  final FirebaseStorage storage;
  final FirebaseFirestore firestore;

  FirebaseDataSource(this.storage, this.firestore);

  Future<Either<Failure, String>> uploadPhoto(File photo) async {
    final ref = storage.ref().child('employees/${photo.hashCode}.jpg');
    try {
      final task = await ref.putFile(photo);
      final url = await task.ref.getDownloadURL();
      return Right(url);
    } catch (e) {
      return Left(Failure.firestore(e.toString()));
    }
  }

  Future<Either<Failure, Unit>> saveEmployeeDetails(Employee employee) async {
    try {
      await firestore.collection('employees').doc(employee.employeeId).set(
            employee.toJson(),
          );
      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(
        Failure.firestore(e.toString()),
      );
    } catch (e) {
      return Left(
        Failure.unexpected(e.toString()),
      );
    }
  }

  Future<void> markAttendance(String id) async {
    DateTime nowdt = DateTime.now();
    final date = DateFormat('dd/MM/yyyy').format(nowdt);
    Timestamp now = Timestamp.fromDate(nowdt);
    final attendanceRef = firestore
        .collection('attendance')
        .where('employeeId', isEqualTo: id)
        .where('date', isEqualTo: date);

    final querySnapshot = await attendanceRef.get();

    if (querySnapshot.docs.isEmpty) {
      // Check-in if no previous record exists for the day
      await firestore.collection('attendance').add({
        'employeeId': id,
        'date': date,
        'checkIn': now,
        'checkOut': null,
      });
    } else {
      // Check-out if there's only one previous record (check-in) for the day
      final attendance = querySnapshot.docs.first.data();

      if (attendance['checkOut'] == null) {
        await firestore
            .collection('attendance')
            .doc(querySnapshot.docs.first.id)
            .update({
          'checkOut': now,
        });
        // return PunchStatus.CHECK_OUT;
      } else {
        // Duplicate punch if check-out already exists
        //return PunchStatus.DUPLICATE;
      }
    }
  }

  Future<Employee> fetchEmployee(String faceId) async {
    final snapshot = await firestore
        .collection('employees')
        .where('faceId', isEqualTo: faceId)
        .get();
    log(snapshot.docs[0].id);
    final doc = snapshot.docs[0];
    return Employee.fromSnapshot(doc);
  }

  Future<List<Attendance>> fetchAttendance(employeeId) async {
    return [];
  }
}
