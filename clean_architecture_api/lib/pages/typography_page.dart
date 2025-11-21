import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:data/datasources/api_service.dart';
import 'package:data/datasources/feed_remote_data_source.dart';
import 'package:data/repositories/feed_repository_impl.dart';
import 'package:domain/repositories/feed_repository.dart';
import 'package:domain/usecases/get_course_detail.dart';
import 'package:clean_architecture_api/pages/TypographyController.dart';
import 'package:clean_architecture_api/widgets/typography_page_widget/course_description_section_widget.dart';
import 'package:clean_architecture_api/widgets/typography_page_widget/course_highlights_section_widget.dart';
import 'package:clean_architecture_api/widgets/typography_page_widget/course_info_section_widget.dart';
import 'package:clean_architecture_api/widgets/typography_page_widget/enroll_section_widget.dart';
import 'package:clean_architecture_api/widgets/typography_page_widget/instructor_section_widget.dart';
import 'package:clean_architecture_api/widgets/typography_page_widget/related_courses_section_widget.dart';
import 'package:clean_architecture_api/widgets/typography_page_widget/skills_section_widget.dart';
import 'package:clean_architecture_api/widgets/typography_page_widget/typography_header_widget.dart';

class TypographyCoursePage extends StatefulWidget {
  const TypographyCoursePage({super.key});

  @override
  State<TypographyCoursePage> createState() => _TypographyCoursePageState();
}

class _TypographyCoursePageState extends State<TypographyCoursePage> {
  @override
  void initState() {
    super.initState();

    /// Get.lazyPut(() => TypographyController());
    if (!Get.isRegistered<Dio>()) {
      Get.lazyPut<Dio>(() => Dio());
      Get.lazyPut<ApiService>(() => ApiService(Get.find<Dio>()));
      Get.lazyPut<FeedRemoteDataSource>(
        () => FeedRemoteDataSourceImpl(Get.find<ApiService>()),
      );
      Get.lazyPut<FeedRepository>(
        () => FeedRepositoryImpl(Get.find<FeedRemoteDataSource>()),
      );
    }
    if (!Get.isRegistered<GetCourseDetail>()) {
      Get.lazyPut<GetCourseDetail>(
        () => GetCourseDetail(Get.find<FeedRepository>()),
      );
    }
    if (!Get.isRegistered<TypographyController>()) {
      Get.lazyPut<TypographyController>(
        () => TypographyController(Get.find<GetCourseDetail>()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TypographyController>();
    return Scaffold(
      body: Obx(() {
        if (controller.items.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.items.length,
          itemBuilder: (context, int index) {
            final item = controller.items[index];

            //if (item is CourseItem) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TypographyHeaderWidget(item: item),
                CourseInfoSectionWidget(item: item),
                CourseDescriptionSectionWidget(item: item),
                CourseHighlightsSectionWidget(item: item),
                SkillsSectionWidget(item: item),
                InstructorSectionWidget(instructor: item.instructor),
                RelatedCoursesSectionWidget(item: item.relatedCourses),
                EnrollSectionWidget(item: item),
              ],
            );
          },
          //},
        );
      }),
    );
  }
}
