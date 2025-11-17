import 'package:flutter/material.dart';

import '../../home_page_items/typography_page_items/course_item.dart';

class CourseInfoSectionWidget extends StatelessWidget {
  final CourseItem item;

  const CourseInfoSectionWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Text(
            item.institute,
            style: const TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.people, size: 18, color: Colors.teal),
              const SizedBox(width: 4),
              Text('${item.enrolledStudents} students already enrolled'),
              const Spacer(),
              Text(
                '${item.price} ${item.currency}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
