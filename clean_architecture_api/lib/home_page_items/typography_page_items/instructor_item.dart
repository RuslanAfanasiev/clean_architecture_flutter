import 'typography_list_item.dart';

class InstructorItem extends TypographyListItem {
  final String name;
  final String title;
  final String bio;
  final String image;

  InstructorItem({
    required this.name,
    required this.title,
    required this.bio,
    required this.image,
  });

  factory InstructorItem.fromJson(Map<String, dynamic> json) {
    return InstructorItem(
      name: json['name'],
      title: json['title'],
      bio: json['bio'],
      image: json['image'],
    );
  }

}
