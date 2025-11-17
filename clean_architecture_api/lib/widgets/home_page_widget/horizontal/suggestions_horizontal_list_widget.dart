import 'package:flutter/material.dart';

import '../../../home_page_items/list_items/suggestions_card_item.dart';
import '../suggestions_card_widget.dart';

class SuggestionsHorizontalListWidget extends StatelessWidget {
  const SuggestionsHorizontalListWidget({super.key, required this.item});

  final List<SuggestionsCardItem> item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: item.length,
        itemBuilder: (context, index) {
          final cardItem = item[index];
          return Padding(
            padding: const EdgeInsets.only(right: 1),
            child: SuggestionsCardWidget(item: cardItem),
          );
        },
      ),
    );
  }
}
