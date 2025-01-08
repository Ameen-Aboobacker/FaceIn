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

  Future<Either<Failure, String>> uploadPhoto(File photo, String path) async {
    final ref = storage.ref().child('employees/$path.jpg');
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
      await firestore
          .collection('employees')
          .doc(employee.id)
          .set(employee.toJson());
      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(Failure.firestore(e.toString()));
    } catch (e) {
      return Left(
        Failure.unexpected(e.toString()),
      );
    }
  }

  Future<Either<Failure, DateTime?>> markAttendance(String id) async {
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
      return Right(nowdt);
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
        return Right(nowdt);
        // return PunchStaLtus.CHECK_OUT;
      } else {
        return const Left(Failure.verification('Duplicate Punch'));
        // Duplicate punch if check-out already exists
        //return PunchStatus.DUPLICATE;
      }
    }
  }

  Future<Either<Failure, Employee>> fetchEmployee(String faceId) async {
    log("face:$faceId");
    try {
      final snapshot = await firestore
          .collection('employees')
          .where('faceId', isEqualTo: faceId)
          .get();
      if (snapshot.docs.isEmpty) {
        return const Left(
          Failure.firestore(
              'Employee not Found,try again or contact admin team'),
        );
      }
      final doc = snapshot.docs[0];

      final employee = Employee.fromSnapshot(doc);
      return Right(employee);
    } on FirebaseException catch (e) {
      return Left(Failure.firestore(e.toString()));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  Future<Either<Failure, List<Attendance>>> fetchAttendance(
      employeeId, date) async {
    try {
      final snapshot = await firestore
          .collection('attendance')
          .where('employeeId', isEqualTo: employeeId)
          .where('date', isEqualTo: date)
          .get();
      final docs = snapshot.docs;
      log(docs.length.toString());
      final attendance = docs.map((doc) => Attendance.fromMap(doc)).toList();
      log('len:${attendance.length}');
      return Right(attendance);
    } on FirebaseException catch (e) {
      log(e.toString());
      return Left(Failure.firestore(e.toString()));
    }
  }

  Future<Either<Failure, List<Employee>>> fetchAllEmployees() async {
    try {
      List<Employee> employees = [];
      final snapshot = await firestore.collection('employees').get();
      log(snapshot.docs.length.toString());
      for (DocumentSnapshot<Map> doc in snapshot.docs) {
        final employee = Employee.fromSnapshot(doc);
        employees.add(employee);
      }
      return Right(employees);
    } on FirebaseException catch (e) {
      return Left(Failure.firestore(e.toString()));
    } catch (e) {
      return Left(Failure.firestore(e.toString()));
    }
  }
}
