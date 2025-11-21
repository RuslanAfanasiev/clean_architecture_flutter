import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home_page_items/typography_page_items/course_item.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_icons.dart';
import '../../resources/image_fix.dart';

class TypographyHeaderWidget extends StatelessWidget {
  final CourseItem item;

  const TypographyHeaderWidget({super.key, required this.item});

  Future<void> _openPreviewVideo(BuildContext context) async {
    final uri = Uri.parse(item.previewVideo);
    final success = await launchUrl(uri, mode: LaunchMode.externalApplication);

    if (!success && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to open preview video')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          fixImageUrl(item.thumbnail),
          height: 240,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: 240,
          color: AppColors.color00434C.withOpacity(0.77),
        ),
        Positioned(
          top: 12,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: AppIcons.bookMarkActive,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: AppColors.color00434C,
                  size: 40,
                ),
                onPressed: () => _openPreviewVideo(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
