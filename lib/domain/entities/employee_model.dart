import 'package:cloud_firestore/cloud_firestore.dart';

class Employee {
  String id;
  String? imageUrl;
  String faceId;
  final String name;
  final String? designation;
  final String email;
  final String contact;
  final Timestamp? createdAt;

  Employee({
    this.faceId = '',
    this.id = '',
    this.imageUrl,
    required this.name,
    required this.designation,
    required this.email,
    required this.contact,
    required this.createdAt,
  });

  // Convert the object to a JSON map
  toJson() {
    return {
      'name': name,
      'designation': designation,
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
    String? designation,
    String? name,
    String? faceId,
    String? imageUrl,
    Timestamp? createdAt,
    String? email,
    String? contact,
  }) {
    return Employee(
      id: id ?? this.id,
      designation: designation ?? this.designation,
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
      designation: employeeData['designation'],
      email: employeeData['email'],
      contact: employeeData['contact'],
      createdAt: employeeData['createdAt'],
      imageUrl: employeeData['imageUrl'] ?? 'assets/images/user_icon.jpg',
      faceId: employeeData['faceId'],
    );
  }
  bool isEmpty() {
    return name.isEmpty ||
        id.isEmpty ||
        email.isEmpty ||
        contact.isEmpty ||
        imageUrl == null;
  }
}
