import 'package:flutter/material.dart';

class VerifyModel {
  String name;
  String id;
  dynamic image;
  String? time;
  Enum? punchType;
  VerifyModel({
    required this.id,
    required this.name,
    required this.image,
    required this.time,
    this.punchType,
  });

  VerifyModel copyWith({
    String? id,
    String? name,
    dynamic imageUrl,
    String? time,
    Enum? punchType,
  }) {
    return VerifyModel(
        id: id ?? this.id,
        name: name ?? this.name,
        image: imageUrl ?? image,
        time: time ?? this.time,
        punchType: punchType ?? this.punchType);
  }

  toMap() {
    return {
      'id': id,
      'time': time,
      'name': name,
    };
  }

  ImageProvider getProfileImage() {
    if (image != null) {
      return MemoryImage(image!);
    } else {
      // Return a placeholder image provider here (e.g., AssetImage)
      return const AssetImage('assets/user_icon.jpg');
    }
  }
}
