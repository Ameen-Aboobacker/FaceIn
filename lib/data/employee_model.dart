

import 'package:cloud_firestore/cloud_firestore.dart';

class Employee {
  String id;
  final String image;
  final String name;
  final String employeeId;
  final String email;
  final String contact;
  final Timestamp? createdAt;
  Employee({
    this.id = '',
    this.image = 'assets/images/user_icon.jpg',
    required this.name,
    required this.employeeId,
    required this.email,
    required this.contact,
    required this.createdAt,
  });
  toJson() {
    return {
      'name': name,
      'employeeId': employeeId,
      'email': email,
      'contact': contact,
      'id': id,
     'createdAt': createdAt
    };
  }

  factory Employee.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final employeeData = snapshot.data()!;
    return Employee(
      name: employeeData['name'],
      id: employeeData['id'],
      employeeId: employeeData['employeeId'],
      email: employeeData['email'],
      contact: employeeData['contact'],
      createdAt: employeeData['createdAt'],
    );
  }
}
