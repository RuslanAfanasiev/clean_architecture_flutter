import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture_api/home_page_items/list_items/search_bar_list_item.dart';
import 'package:clean_architecture_api/resources/app_colors.dart';
import 'package:clean_architecture_api/resources/app_icons.dart';
import 'package:clean_architecture_api/resources/strings.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key, required this.item});

  final SearchBarListItem item;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 379,
        height: 35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.colorD9D9D9, width: 1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: Strings.search,
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: AppColors.color898888,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  // acțiune când utilizatorul apasă "search"
                  if (kDebugMode) {
                    print('Search: $value');
                  }
                },
              ),
            ),
            SizedBox(width: 15, height: 15, child: AppIcons.searchIcon),
          ],
        ),
      ),
    );
  }
}
