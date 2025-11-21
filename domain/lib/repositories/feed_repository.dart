import 'package:domain/entities/course_detail.dart';
import 'package:domain/entities/home_feed.dart';

abstract class FeedRepository {
  Future<HomeFeed> getHomeFeed();

  Future<CourseDetail> getCourseDetail();
}

