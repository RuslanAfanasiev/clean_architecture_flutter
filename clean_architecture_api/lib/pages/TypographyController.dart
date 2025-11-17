import 'package:get/get.dart';
import 'package:clean_architecture_api/json/v1.dart';
import 'package:clean_architecture_api/home_page_items/typography_page_items/course_item.dart';

class TypographyController extends GetxController {
  final RxList<CourseItem> items = RxList();

  @override
  void onInit() {
    super.onInit();
    loadCourse();
  }

  Future<void> loadCourse() async {
    final courseJson = details['course'] as Map<String, dynamic>;
    items.add(CourseItem.fromJson(courseJson));
  }
}
