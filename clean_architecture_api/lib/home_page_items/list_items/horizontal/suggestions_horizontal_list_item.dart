import 'package:clean_architecture_api/home_page_items/list_items/list_item.dart';

import '../suggestions_card_item.dart';

class SuggestionsHorizontalListItem extends ListItem {
  final List<SuggestionsCardItem> item;

  SuggestionsHorizontalListItem({required this.item});

  factory SuggestionsHorizontalListItem.fromJson(List<dynamic> json) {
    final items = json
        .map((e) => SuggestionsCardItem.fromJson(e as Map<String, dynamic>))
        .toList();
    return SuggestionsHorizontalListItem(item: items);
  }
}
