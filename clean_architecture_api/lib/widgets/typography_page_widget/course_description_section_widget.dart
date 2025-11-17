import 'package:flutter/material.dart';
import 'package:clean_architecture_api/home_page_items/typography_page_items/course_item.dart';
import 'package:clean_architecture_api/resources/app_colors.dart';

class CourseDescriptionSectionWidget extends StatelessWidget {
  const CourseDescriptionSectionWidget({super.key, required this.item});

  final CourseItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Course Details',
            style: TextStyle(
              color: AppColors.color00707E,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'Plus Jakarta Sans',
            ),
          ),
          const SizedBox(height: 8),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Visual Communication College's Typography and Layout Design course explores the art and science of typography and layout composition. Learn how to effectively use typefaces, hierarchy, alignment, and grid systems to create visually compelling designs. Gain hands-on experience in editorial design, branding, and digital layouts. ",
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.5,
                    color: AppColors.color6C6C6C,
                    fontFamily: 'Plus Jakarta Sans',
                  ),
                ),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Read More...',
                      style: TextStyle(
                        color: AppColors.color00707E,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Plus Jakarta Sans',
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
