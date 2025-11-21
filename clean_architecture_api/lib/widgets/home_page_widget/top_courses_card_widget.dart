import 'package:flutter/material.dart';
import 'package:clean_architecture_api/home_page_items/list_items/top_courses_card_item.dart';
import 'package:clean_architecture_api/resources/app_colors.dart';
import 'package:clean_architecture_api/resources/app_icons.dart';
import 'package:clean_architecture_api/resources/image_fix.dart';

class TopCoursesCardWidget extends StatefulWidget {
  const TopCoursesCardWidget({super.key, required this.item});

  final TopCoursesCardItem item;

  @override
  State<TopCoursesCardWidget> createState() => _TopCoursesCardWidgetState();
}

class _TopCoursesCardWidgetState extends State<TopCoursesCardWidget> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 1, left: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image.network(
                  fixImageUrl(widget.item.image),
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 2,
                right: 2,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isBookmarked = !isBookmarked;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: isBookmarked
                          ? AppIcons.bookMarkActive
                          : AppIcons.bookMarkEmpty,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColors.color00434C,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.item.institute,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: AppColors.color6C6C6C,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SizedBox(width: 15, height: 15, child: AppIcons.starIcon),
                    const SizedBox(width: 4),
                    Text(
                      widget.item.rating.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.color00434C,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
