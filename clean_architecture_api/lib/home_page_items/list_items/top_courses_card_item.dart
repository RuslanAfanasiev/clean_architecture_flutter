import 'package:clean_architecture_api/home_page_items/list_items/list_item.dart';

class TopCoursesCardItem extends ListItem {
  final String id;
  final String title;
  final String institute;
  final double rating;
  final String image;

  TopCoursesCardItem({
    required this.id,
    required this.title,
    required this.institute,
    required this.rating,
    required this.image,
  });

  factory TopCoursesCardItem.fromJson(Map<String, dynamic> json){
    return TopCoursesCardItem(
        id: json['id'],
        title: json['title'],
        institute: json['institute'],
        rating: json['rating'],
        image: json['image']);
  }
}