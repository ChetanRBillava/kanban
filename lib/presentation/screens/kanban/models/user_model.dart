import 'dart:convert';

import 'package:kanban_board/core/constants/images.dart';

class UserModel {
  String userId;
  String name;
  String gender;
  String image;

  UserModel({
    required this.userId,
    required this.name,
    required this.gender,
    required this.image,
  });

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    userId: json['userID'],
    name: json['name'],
    gender: json['gender'],
    image: json['image'],
  );

  Map<String, dynamic> toMap() => {
    'userID': userId,
    'name': name,
    'gender': gender,
    'image': image,
  };
}

List<UserModel> users = [
  UserModel(userId: '1', name: 'Abhishek', gender: 'male', image: AppImages.user1),
  UserModel(userId: '2', name: 'Siddharth', gender: 'male', image: AppImages.user2),
  UserModel(userId: '3', name: 'Sushmita', gender: 'female', image: AppImages.user3),
  UserModel(userId: '4', name: 'Shekar', gender: 'male', image: AppImages.user4),
];