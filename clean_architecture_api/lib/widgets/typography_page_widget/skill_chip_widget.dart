import 'package:flutter/material.dart';
import 'package:clean_architecture_api/resources/app_colors.dart';

class SkillChipWidget extends StatelessWidget {
  final String label;

  const SkillChipWidget(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
          color: AppColors.color00434C,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: AppColors.colorFFFFFF,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(color: AppColors.colorDEDEDE),
      ),
    );
  }
}
