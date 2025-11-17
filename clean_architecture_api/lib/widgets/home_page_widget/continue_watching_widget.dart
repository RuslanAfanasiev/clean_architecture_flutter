import 'package:flutter/material.dart';
import 'package:clean_architecture_api/home_page_items/list_items/continue_watching_item.dart';
import 'package:clean_architecture_api/widgets/home_page_widget/watching_card_widget.dart';

class ContinueWatchingWidget extends StatelessWidget {
  const ContinueWatchingWidget({super.key, required this.item});

  final ContinueWatchingItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Continue Watching",
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: Color(0xFF184E77),
            ),
          ),
          const SizedBox(height: 12),
          Column(
            children: item.courses
                .map(
                  (course) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: WatchingCardWidget(item: course),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
