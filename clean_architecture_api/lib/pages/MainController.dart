import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:domain/usecases/get_home_feed.dart';
import 'package:clean_architecture_api/home_page_items/list_items/continue_watching_item.dart';
import 'package:clean_architecture_api/home_page_items/list_items/horizontal/top_courses_horizontal_list_item.dart';
import 'package:clean_architecture_api/home_page_items/list_items/list_item.dart';
import 'package:clean_architecture_api/home_page_items/list_items/nav_list_item.dart';
import 'package:clean_architecture_api/home_page_items/list_items/search_bar_list_item.dart';
import 'package:clean_architecture_api/home_page_items/list_items/suggestions_item.dart';
import 'package:clean_architecture_api/home_page_items/list_items/top_courses_item.dart';

import '../home_page_items/list_items/categories_item.dart';
import '../home_page_items/list_items/horizontal/suggestions_horizontal_list_item.dart';
import '../home_page_items/list_items/horizontal/toggle_button_horizontal_list_item.dart';
import '../home_page_items/list_items/suggestions_card_item.dart';
import '../home_page_items/list_items/toggle_button_item.dart';
import '../home_page_items/list_items/top_courses_card_item.dart';
import '../home_page_items/list_items/watching_card_item.dart';

class MainController extends GetxController {
  final GetHomeFeed getHomeFeed;

  MainController(this.getHomeFeed);

  RxList<ListItem> items = <ListItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData(); // aici se încarcă tot
  }

  Future<void> loadData() async {
    try {
      final homeFeed = await getHomeFeed();
      items.clear();

      items.add(
        NavbarListItem(
          name: homeFeed.user.name,
          notifications: homeFeed.user.notifications,
        ),
      );

      items.add(SearchBarListItem());

      items.add(
        ContinueWatchingItem(
          courses: homeFeed.continueWatching
              .map(
                (course) => WatchingCardItem(
                  id: course.id,
                  title: course.title,
                  institute: course.institute,
                  rating: course.rating,
                  progress: course.progress ?? 0,
                  image: course.image,
                ),
              )
              .toList(),
        ),
      );

      items.add(CategoriesItem());
      final categories = homeFeed.categories
          .map(
            (category) => ToggleButtonItem(
              name: category.name,
              id: category.id,
            ),
          )
          .toList();
      items.add(ToggleButtonHorizontalListItem(item: categories));

      items.add(SuggestionsItem());
      final suggestions = homeFeed.suggestions
          .map(
            (course) => SuggestionsCardItem(
              id: course.id,
              title: course.title,
              institute: course.institute,
              rating: course.rating,
              image: course.image,
            ),
          )
          .toList();
      items.add(SuggestionsHorizontalListItem(item: suggestions));

      items.add(TopCoursesItem());
      final topCourses = homeFeed.topCourses
          .map(
            (course) => TopCoursesCardItem(
              id: course.id,
              title: course.title,
              institute: course.institute,
              rating: course.rating,
              image: course.image,
            ),
          )
          .toList();
      items.add(TopCoursesHorizontalListItem(item: topCourses));
    } catch (e) {
      debugPrint('Failed to load home data: $e');
    } finally {
      update();
    }
  }
}
