import 'typography_list_item.dart';

class LessonItem extends TypographyListItem {
  final String id;
  final String title;
  final String duration;
  final bool isPreview;

  LessonItem({
    required this.id,
    required this.title,
    required this.duration,
    required this.isPreview,
  });

  factory LessonItem.fromJson(Map<String, dynamic> json) {
    return LessonItem(
      id: json['id'],
      title: json['title'],
      duration: json['duration'],
      isPreview: json['isPreview'],
    );
  }
}
