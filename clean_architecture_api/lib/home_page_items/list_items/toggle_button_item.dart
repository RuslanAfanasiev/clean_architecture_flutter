import 'package:clean_architecture_api/home_page_items/list_items/list_item.dart';

class ToggleButtonItem extends ListItem {
  final String name;
  final String? id;

  ToggleButtonItem({required this.name, required this.id});

  factory ToggleButtonItem.fromJson(Map<String, dynamic> json) {
    return ToggleButtonItem(
      name: json['name'] as String,
      id: json['id'] as String,
    );
  }
}
