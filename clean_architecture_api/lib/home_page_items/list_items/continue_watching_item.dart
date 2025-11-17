import 'package:clean_architecture_api/home_page_items/list_items/list_item.dart';

import 'watching_card_item.dart';

class ContinueWatchingItem extends ListItem {
  final List<WatchingCardItem> courses;

  ContinueWatchingItem({required this.courses});

  factory ContinueWatchingItem.fromJson(List<dynamic> jsonList) {
    final courses = jsonList
        .map((json) => WatchingCardItem.fromJson(json as Map<String, dynamic>))
        .toList();

    return ContinueWatchingItem(courses: courses);
  }
}
