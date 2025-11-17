import 'typography_list_item.dart';

class RelatedCourseItem extends TypographyListItem {
  final String id;
  final String title;
  final String institute;
  final double price;
  final double rating;
  final String image;

  RelatedCourseItem({
    required this.id,
    required this.title,
    required this.institute,
    required this.price,
    required this.rating,
    required this.image,
  });

  factory RelatedCourseItem.fromJson(Map<String, dynamic> json) {
    return RelatedCourseItem(
      id: json['id'],
      title: json['title'],
      institute: json['institute'],
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      image: json['image'],
    );
  }
}
