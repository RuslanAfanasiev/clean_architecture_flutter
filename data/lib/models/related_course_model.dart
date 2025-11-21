import 'package:domain/entities/related_course.dart';

class RelatedCourseModel {
  final String id;
  final String title;
  final String institute;
  final double price;
  final double rating;
  final String image;

  const RelatedCourseModel({
    required this.id,
    required this.title,
    required this.institute,
    required this.price,
    required this.rating,
    required this.image,
  });

  factory RelatedCourseModel.fromJson(Map<String, dynamic> json) {
    return RelatedCourseModel(
      id: json['id'] as String,
      title: json['title'] as String,
      institute: json['institute'] as String,
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      image: json['image'] as String,
    );
  }

  RelatedCourse toEntity() {
    return RelatedCourse(
      id: id,
      title: title,
      institute: institute,
      price: price,
      rating: rating,
      image: image,
    );
  }
}

