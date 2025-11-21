import 'package:domain/entities/course_detail.dart';

import 'instructor_model.dart';
import 'lesson_model.dart';
import 'related_course_model.dart';

class CourseDetailModel {
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
  final InstructorModel instructor;
  final List<LessonModel> lessons;
  final List<RelatedCourseModel> relatedCourses;

  const CourseDetailModel({
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

  factory CourseDetailModel.fromJson(Map<String, dynamic> json) {
    final skillsJson = json['skills'] as List<dynamic>? ?? <dynamic>[];
    final courseDetailsJson =
        json['courseDetails'] as Map<String, dynamic>? ?? <String, dynamic>{};
    final instructorJson =
        json['instructor'] as Map<String, dynamic>? ?? <String, dynamic>{};
    final lessonsJson = json['lessons'] as List<dynamic>? ?? <dynamic>[];
    final relatedCoursesJson =
        json['relatedCourses'] as List<dynamic>? ?? <dynamic>[];

    return CourseDetailModel(
      id: json['id'] as String,
      title: json['title'] as String,
      institute: json['institute'] as String,
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String,
      enrolledStudents: json['enrolledStudents'] as int,
      rating: (json['rating'] as num).toDouble(),
      lectures: json['lectures'] as int,
      duration: json['duration'] as String,
      certification: json['certification'] as String,
      thumbnail: json['thumbnail'] as String,
      previewVideo: json['previewVideo'] as String,
      description: json['description'] as String,
      skills: skillsJson.cast<String>(),
      courseDetails: courseDetailsJson.map(
        (key, value) => MapEntry(
          key as String,
          value as String,
        ),
      ),
      instructor: InstructorModel.fromJson(instructorJson),
      lessons: lessonsJson
          .map(
            (e) => LessonModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      relatedCourses: relatedCoursesJson
          .map(
            (e) => RelatedCourseModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }

  CourseDetail toEntity() {
    return CourseDetail(
      id: id,
      title: title,
      institute: institute,
      price: price,
      currency: currency,
      enrolledStudents: enrolledStudents,
      rating: rating,
      lectures: lectures,
      duration: duration,
      certification: certification,
      thumbnail: thumbnail,
      previewVideo: previewVideo,
      description: description,
      skills: List<String>.from(skills),
      courseDetails: Map<String, String>.from(courseDetails),
      instructor: instructor.toEntity(),
      lessons: lessons.map((e) => e.toEntity()).toList(growable: false),
      relatedCourses:
          relatedCourses.map((e) => e.toEntity()).toList(growable: false),
    );
  }
}

