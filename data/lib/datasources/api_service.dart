import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://test-api-jlbn.onrender.com/v1/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/feed')
  Future<dynamic> getHomeData();

  @GET('/feed/details')
  Future<dynamic> getDetails();
}

