import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/attendance_model.dart';
import '../../domain/entities/employee_model.dart';

class FirebaseDataSource {
  final FirebaseStorage storage;
  final FirebaseFirestore firestore;

  FirebaseDataSource(this.storage, this.firestore);

  Future<String> uploadPhoto(File photo) async {
    final ref = storage.ref().child('photos/${photo.hashCode}.jpg');
    final task = await ref.putFile(photo);
    final url = await task.ref.getDownloadURL();
    return url;
  }

  Future<void> saveEmployeeDetails(Employee employee) async {
    await firestore.collection('employees').doc(employee.employeeId).set(
          employee.toJson(),
        );
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
