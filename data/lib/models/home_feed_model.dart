import 'package:domain/entities/home_feed.dart';

import 'category_model.dart';
import 'course_overview_model.dart';
import 'user_model.dart';

class HomeFeedModel {
  final UserModel user;
  final List<CourseOverviewModel> continueWatching;
  final List<CategoryModel> categories;
  final List<CourseOverviewModel> suggestions;
  final List<CourseOverviewModel> topCourses;

  const HomeFeedModel({
    required this.user,
    required this.continueWatching,
    required this.categories,
    required this.suggestions,
    required this.topCourses,
  });

  factory HomeFeedModel.fromJson(Map<String, dynamic> json) {
    final userJson = json['user'] as Map<String, dynamic>;
    final continueWatchingJson =
        json['continueWatching'] as List<dynamic>? ?? <dynamic>[];
    final categoriesJson =
        json['categories'] as List<dynamic>? ?? <dynamic>[];
    final suggestionsJson =
        json['suggestions'] as List<dynamic>? ?? <dynamic>[];
    final topCoursesJson =
        json['topCourses'] as List<dynamic>? ?? <dynamic>[];

    return HomeFeedModel(
      user: UserModel.fromJson(userJson),
      continueWatching: continueWatchingJson
          .map(
            (e) => CourseOverviewModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      categories: categoriesJson
          .map(
            (e) => CategoryModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      suggestions: suggestionsJson
          .map(
            (e) => CourseOverviewModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      topCourses: topCoursesJson
          .map(
            (e) => CourseOverviewModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }

  HomeFeed toEntity() {
    return HomeFeed(
      user: user.toEntity(),
      continueWatching:
          continueWatching.map((e) => e.toEntity()).toList(growable: false),
      categories: categories.map((e) => e.toEntity()).toList(growable: false),
      suggestions:
          suggestions.map((e) => e.toEntity()).toList(growable: false),
      topCourses: topCourses.map((e) => e.toEntity()).toList(growable: false),
    );
  }
}

