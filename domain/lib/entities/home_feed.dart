import 'package:domain/entities/category.dart';
import 'package:domain/entities/course_overview.dart';
import 'package:domain/entities/user.dart';

class HomeFeed {
  final User user;
  final List<CourseOverview> continueWatching;
  final List<Category> categories;
  final List<CourseOverview> suggestions;
  final List<CourseOverview> topCourses;

  const HomeFeed({
    required this.user,
    required this.continueWatching,
    required this.categories,
    required this.suggestions,
    required this.topCourses,
  });
}

