import 'package:flutter/material.dart';

import '../../home_page_items/typography_page_items/course_item.dart';
import '../../resources/app_colors.dart';

class EnrollSectionWidget extends StatelessWidget {
  final CourseItem item;

  const EnrollSectionWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: AppColors.color00434C,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Enroll Now',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Start your 7-day free trial',
            style: TextStyle(
              fontSize: 16,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w600,
              color: AppColors.color6C6C6C,
            ),
          ),
        ],
      ),
    );
  }
}
