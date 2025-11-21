import 'package:data/datasources/api_service.dart';
import 'package:data/models/course_detail_model.dart';
import 'package:data/models/home_feed_model.dart';

abstract class FeedRemoteDataSource {
  Future<HomeFeedModel> getHomeFeed();

  Future<CourseDetailModel> getCourseDetail();
}

class FeedRemoteDataSourceImpl implements FeedRemoteDataSource {
  final ApiService apiService;

  FeedRemoteDataSourceImpl(this.apiService);

  @override
  Future<HomeFeedModel> getHomeFeed() async {
    final json = await apiService.getHomeData() as Map<String, dynamic>;
    return HomeFeedModel.fromJson(json);
  }

  @override
  Future<CourseDetailModel> getCourseDetail() async {
    final json = await apiService.getDetails() as Map<String, dynamic>;
    final courseJson = json['course'] as Map<String, dynamic>;
    return CourseDetailModel.fromJson(courseJson);
  }
}

