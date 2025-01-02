import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Attendance {
  final String userId;
  final String date;
  final Timestamp checkIn;
  final Timestamp? checkOut;

  Attendance({
    required this.userId,
    required this.date,
    required this.checkIn,
    this.checkOut,
  });

  factory Attendance.fromMap(DocumentSnapshot<Map<String, dynamic>> doc) {
    final map = doc.data()!;
    return Attendance(
      userId: map['employeeId'],
      date: map['date'],
      checkIn: map['checkIn'],
      checkOut: map['checkOut'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'date': date,
      'checkIn': checkIn,
      'checkOut': checkOut,
    };
  }

  Map<String, String> formatAttendance() {
    String cin = DateFormat('hh:mm:ss a').format(checkIn.toDate());
    String out = checkOut != null
        ? DateFormat('hh:mm:ss a').format(checkOut!.toDate())
        : 'check out not marked';
    return {'in': cin, 'out': out};
  }
}
