import 'package:clean_architecture_api/home_page_items/list_items/list_item.dart';


class SuggestionsCardItem extends ListItem {
  final String id;
  final String title;
  final String institute;
  final double rating;
  final String image;

  SuggestionsCardItem({
    required this.id,
    required this.title,
    required this.institute,
    required this.rating,
    required this.image,
  });

  factory SuggestionsCardItem.fromJson(Map<String, dynamic> json) {
    return SuggestionsCardItem(
      id: json['id'] as String,
      title: json['title'] as String,
      institute: json['institute'] as String,
      rating: (json['rating'] as num).toDouble(),
      image: json['image'] as String,
    );
  }
}
