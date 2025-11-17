import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:clean_architecture_api/home_page_items/typography_page_items/course_item.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://test-api-jlbn.onrender.com/v1/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/feed")
  Future<dynamic> getHomeData();

  @GET("/feed/details")
  Future<CourseItem> getDetails();
}
