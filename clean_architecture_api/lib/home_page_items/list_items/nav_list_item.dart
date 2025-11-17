import 'package:clean_architecture_api/home_page_items/list_items/list_item.dart';

//TODO: json serializable
class NavbarListItem extends ListItem {
  final String name;
  final int notifications;

  NavbarListItem({required this.name, required this.notifications});

  factory NavbarListItem.fromJson(Map<String, dynamic> json) {
    return NavbarListItem(
      name: json['name'] as String,
      notifications: json['notifications'] as int,
    );
  }
}
