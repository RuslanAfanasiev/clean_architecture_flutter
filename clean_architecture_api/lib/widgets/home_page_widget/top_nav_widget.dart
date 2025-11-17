import 'package:flutter/material.dart';
import 'package:clean_architecture_api/home_page_items/list_items/nav_list_item.dart';
import 'package:clean_architecture_api/resources/app_colors.dart';
import 'package:clean_architecture_api/resources/app_icons.dart';

import '../../resources/strings.dart';

class TopNavbarWidget extends StatelessWidget {
  const TopNavbarWidget({super.key, required this.item});

  final NavbarListItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22, left: 13, right: 21, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w700,
                fontSize: 20,
                height: 1.2,
                letterSpacing: 1.0,
              ),
              children: [
                TextSpan(
                  text: "${Strings.welcome} ",
                  style: const TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: item.name,
                  style: TextStyle(color: AppColors.color00434C),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              AppIcons.notificationIcon,
              if (item.notifications > 0)
                Positioned(
                  right: 0,
                  bottom: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 5,
                      minHeight: 5,
                    ),
                    child: Text(
                      '${item.notifications}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
