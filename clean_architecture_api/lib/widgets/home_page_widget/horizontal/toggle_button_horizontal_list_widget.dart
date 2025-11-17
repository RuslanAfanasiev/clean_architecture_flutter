import 'package:flutter/material.dart';
import 'package:clean_architecture_api/widgets/home_page_widget/toggle_button_widget.dart';
import '../../../home_page_items/list_items/toggle_button_item.dart';
class ToggleButtonHorizontalListWidget extends StatelessWidget {
  final List<ToggleButtonItem> item;

  const ToggleButtonHorizontalListWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: item.length,
        itemBuilder: (context, index) {
          final cardItem = item[index];
          return Padding(
            padding: const EdgeInsets.only(left: 17),
            child: ToggleButtonWidget(item: cardItem),
          );
        },
      ),
    );
  }
}
