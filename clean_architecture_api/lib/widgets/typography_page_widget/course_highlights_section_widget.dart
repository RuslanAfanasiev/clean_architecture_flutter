import 'package:flutter/material.dart';
import '../../home_page_items/typography_page_items/course_item.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_icons.dart';

class CourseHighlightsSectionWidget extends StatelessWidget {
  final CourseItem item;

  const CourseHighlightsSectionWidget({super.key, required this.item});

  String _formatKey(String key) {
    final buffer = StringBuffer();
    for (int i = 0; i < key.length; i++) {
      final char = key[i];
      if (i == 0) {
        buffer.write(char.toUpperCase());
      } else if (char == '_' || char == ' ') {
        buffer.write(' ');
      } else if (char.toUpperCase() == char && char != char.toLowerCase()) {
        buffer.write(' ');
        buffer.write(char);
      } else {
        buffer.write(char);
      }
    }
    return buffer.toString().replaceAll('  ', ' ').trim();
  }

  @override
  Widget build(BuildContext context) {
    final details = [
      (icon: AppIcons.lectureIcon, key: 'lectures'),
      (icon: AppIcons.timeIcon, key: 'learningTime'),
      (icon: AppIcons.certificateIcon, key: 'certification'),
    ]
        .map((entry) => (
    icon: entry.icon,
    key: entry.key,
    value: item.courseDetails[entry.key]?.trim() ?? '',
    ))
        .where((entry) => entry.value.isNotEmpty)
        .toList();

    if (details.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: details
                  .map(
                    (entry) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 22, height: 22, child: entry.icon),
                          const SizedBox(width: 12),
                          Text(
                            _formatKey(entry.key),
                            style: TextStyle(
                              color: AppColors.color00434C,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: 120,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            entry.value,
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.color6C6C6C,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
                  .toList(),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}