import 'package:domain/entities/course_detail.dart';
import 'package:domain/repositories/feed_repository.dart';

class GetCourseDetail {
  final FeedRepository repository;

  const GetCourseDetail(this.repository);

  Future<CourseDetail> call() {
    return repository.getCourseDetail();
  }
}
