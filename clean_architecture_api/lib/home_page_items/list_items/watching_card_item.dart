import 'package:clean_architecture_api/home_page_items/list_items/list_item.dart';

class WatchingCardItem extends ListItem {
  final String id;
  final String title;
  final String institute;
  final double rating;
  final int progress;
  final String image;

  WatchingCardItem({
    required this.id,
    required this.title,
    required this.institute,
    required this.rating,
    required this.progress,
    required this.image,
  });

  factory WatchingCardItem.fromJson(Map<String, dynamic> json) {
    return WatchingCardItem(
      id: json['id'] as String,
      title: json['title'] as String,
      institute: json['institute'] as String,
      rating: (json['rating'] as num).toDouble(),
      progress: json['progress'] as int,
      image: json['image'] as String,
    );
  }
}
