import 'package:domain/entities/course_overview.dart';

class CourseOverviewModel {
  final String id;
  final String title;
  final String institute;
  final double rating;
  final String image;
  final int? progress;

  const CourseOverviewModel({
    required this.id,
    required this.title,
    required this.institute,
    required this.rating,
    required this.image,
    this.progress,
  });

  factory CourseOverviewModel.fromJson(Map<String, dynamic> json) {
    return CourseOverviewModel(
      id: json['id'] as String,
      title: json['title'] as String,
      institute: json['institute'] as String,
      rating: (json['rating'] as num).toDouble(),
      image: json['image'] as String,
      progress: json['progress'] as int?,
    );
  }

  CourseOverview toEntity() {
    return CourseOverview(
      id: id,
      title: title,
      institute: institute,
      rating: rating,
      image: image,
      progress: progress,
    );
  }
}

