import 'package:flutter/material.dart';
import 'package:clean_architecture_api/home_page_items/list_items/suggestions_item.dart';
import 'package:clean_architecture_api/resources/strings.dart';

import '../../resources/app_colors.dart';

class SuggestionsWidget extends StatelessWidget {
  const SuggestionsWidget({super.key, required this.item});

  final SuggestionsItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 106,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Strings.suggestionsForYou,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.color00434C,
            ),
          ),
          Text(
            Strings.seeAll,
            style: TextStyle(
              fontSize: 10,
              decoration: TextDecoration.underline,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w400,
              color: AppColors.color6C6C6C,
            ),
          ),
        ],
      ),
    );
  }
}
