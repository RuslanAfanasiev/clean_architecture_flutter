import 'package:clean_architecture_api/home_page_items/typography_page_items/related_course_item.dart';

import 'typography_list_item.dart';
import 'instructor_item.dart';
import 'lesson_item.dart';

class CourseItem extends TypographyListItem {
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
  final InstructorItem instructor;
  final List<LessonItem> lessons;
  final List<RelatedCourseItem> relatedCourses;

  CourseItem({
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

  factory CourseItem.fromJson(Map<String, dynamic> json) {
    return CourseItem(
      id: json['id'],
      title: json['title'],
      institute: json['institute'],
      price: (json['price'] as num).toDouble(),
      currency: json['currency'],
      enrolledStudents: json['enrolledStudents'],
      rating: (json['rating'] as num).toDouble(),
      lectures: json['lectures'],
      duration: json['duration'],
      certification: json['certification'],
      thumbnail: json['thumbnail'],
      previewVideo: json['previewVideo'],
      description: json['description'],
      skills: List<String>.from(json['skills']),
      courseDetails: Map<String, String>.from(json['courseDetails']),
      instructor: InstructorItem.fromJson(json['instructor']),
      lessons: (json['lessons'] as List)
          .map((e) => LessonItem.fromJson(e))
          .toList(),
      relatedCourses: (json['relatedCourses'] as List)
          .map((e) => RelatedCourseItem.fromJson(e))
          .toList(),
    );
  }
}
