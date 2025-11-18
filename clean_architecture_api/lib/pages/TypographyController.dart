import 'package:get/get.dart';
import 'package:clean_architecture_api/home_page_items/typography_page_items/course_item.dart';

import '../services/api_service.dart';

class TypographyController extends GetxController {
  final RxList<CourseItem> items = RxList();

  final ApiService api;

  TypographyController(this.api);

  @override
  void onInit() {
    super.onInit();
    loadCourse();
  }

  Future<void> loadCourse() async {
    final typJson = await api.getDetails() as Map<String, dynamic>;
    final courseJson = typJson['course'] as Map<String, dynamic>;
    items.add(CourseItem.fromJson(courseJson));
  }
}
