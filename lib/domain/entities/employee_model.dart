import 'package:cloud_firestore/cloud_firestore.dart';

class Employee {
  String id;
  String imageUrl;
  String faceId;
  final String name;
  final String employeeId;
  final String email;
  final String contact;
  final Timestamp? createdAt;

  Employee({
    this.faceId = '',
    this.id = '',
    this.imageUrl = 'assets/images/user_icon.jpg',
    required this.name,
    required this.employeeId,
    required this.email,
    required this.contact,
    required this.createdAt,
  });

  // Convert the object to a JSON map
  toJson() {
    return {
      'name': name,
      'employeeId': employeeId,
      'email': email,
      'contact': contact,
      'id': id,
      'createdAt': createdAt,
      'imageUrl': imageUrl,
      'faceId': faceId
    };
  }

  // Copy constructor to create a new Employee with the option to change some fields
  Employee copyWith({
    String? id,
    String? employeeId,
    String? name,
    String? faceId,
    String? imageUrl,
    Timestamp? createdAt,
    String? email,
    String? contact,
  }) {
    return Employee(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      name: name ?? this.name,
      faceId: faceId ?? this.faceId,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      email: email ?? this.email,
      contact: contact ?? this.contact,
    );
  }

  // Factory constructor to create Employee from Firestore snapshot
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
      imageUrl: employeeData['imageUrl'],
      faceId: employeeData['faceId'],
    );
  }
}
