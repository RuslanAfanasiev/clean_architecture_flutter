import 'package:domain/entities/instructor.dart';

class InstructorModel {
  final String name;
  final String title;
  final String bio;
  final String image;

  const InstructorModel({
    required this.name,
    required this.title,
    required this.bio,
    required this.image,
  });

  factory InstructorModel.fromJson(Map<String, dynamic> json) {
    return InstructorModel(
      name: json['name'] as String,
      title: json['title'] as String,
      bio: json['bio'] as String,
      image: json['image'] as String,
    );
  }

  Instructor toEntity() {
    return Instructor(
      name: name,
      title: title,
      bio: bio,
      image: image,
    );
  }
}

