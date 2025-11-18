import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
import '../services/api_service.dart';

class MainController extends GetxController {
  final ApiService api;

  MainController(this.api);

  RxList<ListItem> items = <ListItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData(); // aici se încarcă tot
  }

  Future<void> loadData() async {
    try {
      final homeJson = await api.getHomeData() as Map<String, dynamic>;

      items.clear();

      final userJson = homeJson['user'];
      items.add(NavbarListItem.fromJson(userJson));

      items.add(SearchBarListItem());

      final continueWatchingList =
          homeJson['continueWatching'] as List<dynamic>;
      items.add(ContinueWatchingItem.fromJson(continueWatchingList));

      items.add(CategoriesItem());
      final categoriesJson = homeJson['categories'] as List<dynamic>;
      final categories = categoriesJson
          .map((e) => ToggleButtonItem.fromJson(e as Map<String, dynamic>))
          .toList();
      items.add(ToggleButtonHorizontalListItem(item: categories));

      items.add(SuggestionsItem());
      final suggestionsJson = homeJson['suggestions'] as List<dynamic>;
      final suggestions = suggestionsJson
          .map((e) => SuggestionsCardItem.fromJson(e as Map<String, dynamic>))
          .toList();
      items.add(SuggestionsHorizontalListItem(item: suggestions));

      items.add(TopCoursesItem());
      final topCoursesJson = homeJson['topCourses'] as List<dynamic>;
      final topCourses = topCoursesJson
          .map((e) => TopCoursesCardItem.fromJson(e as Map<String, dynamic>))
          .toList();
      items.add(TopCoursesHorizontalListItem(item: topCourses));
    } catch (e) {
      debugPrint('Failed to load home data: $e');
    } finally {
      update();
    }
  }
}
