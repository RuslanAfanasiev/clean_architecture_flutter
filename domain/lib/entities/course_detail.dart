import 'package:domain/entities/instructor.dart';
import 'package:domain/entities/lesson.dart';
import 'package:domain/entities/related_course.dart';

class CourseDetail {
  final String id;
  final String title;
  final String institute;
  final double price;
  final String currency;
  final int enrolledStudents;
  final double rating;
  final int lectures;
  final String duration;
  final String certification;
  final String thumbnail;
  final String previewVideo;
  final String description;
  final List<String> skills;
  final Map<String, String> courseDetails;
  final Instructor instructor;
  final List<Lesson> lessons;
  final List<RelatedCourse> relatedCourses;

  const CourseDetail({
    required this.id,
    required this.title,
    required this.institute,
    required this.price,
    required this.currency,
    required this.enrolledStudents,
    required this.rating,
    required this.lectures,
    required this.duration,
    required this.certification,
    required this.thumbnail,
    required this.previewVideo,
    required this.description,
    required this.skills,
    required this.courseDetails,
    required this.instructor,
    required this.lessons,
    required this.relatedCourses,
  });
}

