import 'package:domain/entities/lesson.dart';

class LessonModel {
  final String id;
  final String title;
  final String duration;
  final bool isPreview;

  const LessonModel({
    required this.id,
    required this.title,
    required this.duration,
    required this.isPreview,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'] as String,
      title: json['title'] as String,
      duration: json['duration'] as String,
      isPreview: json['isPreview'] as bool,
    );
  }

  Lesson toEntity() {
    return Lesson(
      id: id,
      title: title,
      duration: duration,
      isPreview: isPreview,
    );
  }
}

