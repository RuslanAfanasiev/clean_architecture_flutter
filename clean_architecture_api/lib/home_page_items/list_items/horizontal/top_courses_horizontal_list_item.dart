import 'package:clean_architecture_api/home_page_items/list_items/list_item.dart';
import 'package:clean_architecture_api/home_page_items/list_items/top_courses_card_item.dart';

class TopCoursesHorizontalListItem extends ListItem {
  final List<TopCoursesCardItem> item;

  TopCoursesHorizontalListItem({required this.item});

  factory TopCoursesHorizontalListItem.fromJson(List<dynamic> json) {
    final items = json
        .map((e) => TopCoursesCardItem.fromJson(e as Map<String, dynamic>))
        .toList();
    return TopCoursesHorizontalListItem(item: items);
  }
}
