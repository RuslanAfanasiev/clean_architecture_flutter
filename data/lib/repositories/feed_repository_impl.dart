import 'package:data/datasources/feed_remote_data_source.dart';
import 'package:domain/entities/course_detail.dart';
import 'package:domain/entities/home_feed.dart';
import 'package:domain/repositories/feed_repository.dart';

class FeedRepositoryImpl implements FeedRepository {
  final FeedRemoteDataSource remoteDataSource;

  FeedRepositoryImpl(this.remoteDataSource);

  @override
  Future<HomeFeed> getHomeFeed() async {
    final model = await remoteDataSource.getHomeFeed();
    return model.toEntity();
  }

  @override
  Future<CourseDetail> getCourseDetail() async {
    final model = await remoteDataSource.getCourseDetail();
    return model.toEntity();
  }
}

