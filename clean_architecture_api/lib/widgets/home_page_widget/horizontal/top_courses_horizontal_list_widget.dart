import 'package:flutter/material.dart';
import 'package:clean_architecture_api/home_page_items/list_items/top_courses_card_item.dart';

import '../top_courses_card_widget.dart';

class TopCoursesHorizontalListWidget extends StatelessWidget {
  const TopCoursesHorizontalListWidget({super.key, required this.item});

  final List<TopCoursesCardItem> item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: item.length,
        itemBuilder: (context, index) {
          final cardItem = item[index];
          return Padding(
            padding: const EdgeInsets.only(right: 1),
            child: TopCoursesCardWidget(item: cardItem),
          );
        },
      ),
    );
  }
}