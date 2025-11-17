import 'package:flutter/material.dart';
import 'package:clean_architecture_api/resources/app_colors.dart';
import 'package:clean_architecture_api/widgets/typography_page_widget/skill_chip_widget.dart';
import '../../home_page_items/typography_page_items/course_item.dart';

class SkillsSectionWidget extends StatelessWidget {
  final CourseItem item;
  const SkillsSectionWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.color00707E,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: item.skills.map((skill) {
              return SkillChipWidget(skill);
            }).toList(),
          ),
        ],
      ),
    );
  }
}