import 'package:flutter/cupertino.dart';
import 'package:clean_architecture_api/home_page_items/list_items/toggle_button_item.dart';
import 'package:clean_architecture_api/resources/app_colors.dart';

class ToggleButtonWidget extends StatelessWidget {
  const ToggleButtonWidget({super.key, required this.item});

  final ToggleButtonItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      margin: const EdgeInsets.only(right: 0.1),
      decoration: BoxDecoration(
        color: AppColors.colorFFFFFF,
        border: Border.all(color: AppColors.color00707E, width: 1.2),
        borderRadius: BorderRadius.circular(60),
      ),
      child: Center(
        child: Text(
          item.name,
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.color00434C,
          ),
        ),
      ),
    );
  }
}
