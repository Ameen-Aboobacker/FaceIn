import 'package:flutter/material.dart';

class VerifyModel {
  String name;
  String id;
  dynamic image;
  String? time;
  VerifyModel({
    required this.id,
    required this.name,
    required this.image,
    this.time,
  });

  VerifyModel copyWith({
    String? id,
    String? name,
    dynamic imageUrl,
    String? time,
  }) {
    return VerifyModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: imageUrl ?? image,
      time: time ?? this.time,
    );
  }

  toMap() {
    return {
      'id': id,
      'time': time,
      'name': name,
    };
  }

  Image getProfileImage() {
    if (image != null) {
      return Image.network(fit: BoxFit.contain, image!);
    } else {
      // Return a placeholder image provider here (e.g., AssetImage)
      return Image.asset('assets/user_icon.jpg');
    }
  }
}
