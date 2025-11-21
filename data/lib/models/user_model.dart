import 'package:domain/entities/user.dart';

class UserModel {
  final String name;
  final int notifications;

  const UserModel({
    required this.name,
    required this.notifications,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      notifications: json['notifications'] as int,
    );
  }

  User toEntity() {
    return User(
      name: name,
      notifications: notifications,
    );
  }
}

