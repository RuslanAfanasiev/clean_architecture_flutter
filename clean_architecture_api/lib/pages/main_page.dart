import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:data/datasources/api_service.dart';
import 'package:data/datasources/feed_remote_data_source.dart';
import 'package:data/repositories/feed_repository_impl.dart';
import 'package:domain/repositories/feed_repository.dart';
import 'package:domain/usecases/get_home_feed.dart';
import 'package:clean_architecture_api/home_page_items/list_items/categories_item.dart';
import 'package:clean_architecture_api/home_page_items/list_items/continue_watching_item.dart';
import 'package:clean_architecture_api/home_page_items/list_items/watching_card_item.dart';
import 'package:clean_architecture_api/home_page_items/list_items/horizontal/suggestions_horizontal_list_item.dart';
import 'package:clean_architecture_api/home_page_items/list_items/horizontal/toggle_button_horizontal_list_item.dart';
import 'package:clean_architecture_api/home_page_items/list_items/horizontal/top_courses_horizontal_list_item.dart';
import 'package:clean_architecture_api/home_page_items/list_items/nav_list_item.dart';
import 'package:clean_architecture_api/home_page_items/list_items/search_bar_list_item.dart';
import 'package:clean_architecture_api/home_page_items/list_items/suggestions_item.dart';
import 'package:clean_architecture_api/home_page_items/list_items/top_courses_item.dart';
import 'package:clean_architecture_api/pages/MainController.dart';
import 'package:clean_architecture_api/widgets/home_page_widget/categories_widget.dart';
import 'package:clean_architecture_api/widgets/home_page_widget/continue_watching_widget.dart';
import 'package:clean_architecture_api/widgets/home_page_widget/watching_card_widget.dart';
import 'package:clean_architecture_api/widgets/home_page_widget/horizontal/suggestions_horizontal_list_widget.dart';
import 'package:clean_architecture_api/widgets/home_page_widget/horizontal/toggle_button_horizontal_list_widget.dart';
import 'package:clean_architecture_api/widgets/home_page_widget/horizontal/top_courses_horizontal_list_widget.dart';
import 'package:clean_architecture_api/widgets/home_page_widget/search_bar_widget.dart';
import 'package:clean_architecture_api/widgets/home_page_widget/suggestions_widget.dart';
import 'package:clean_architecture_api/widgets/home_page_widget/top_courses_widget.dart';
import 'package:clean_architecture_api/widgets/home_page_widget/top_nav_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<Dio>()) {
      Get.lazyPut<Dio>(() => Dio());
      Get.lazyPut<ApiService>(() => ApiService(Get.find<Dio>()));
      Get.lazyPut<FeedRemoteDataSource>(
        () => FeedRemoteDataSourceImpl(Get.find<ApiService>()),
      );
      Get.lazyPut<FeedRepository>(
        () => FeedRepositoryImpl(Get.find<FeedRemoteDataSource>()),
      );
      Get.lazyPut<GetHomeFeed>(
        () => GetHomeFeed(Get.find<FeedRepository>()),
      );
    }
    if (!Get.isRegistered<MainController>()) {
      Get.lazyPut<MainController>(
        () => MainController(Get.find<GetHomeFeed>()),
      );
    }

    // Get.lazyPut(() => MainController());
    // Așteaptă un frame înainte să deschidă tastatura
    WidgetsBinding.instance.addPostFrameCallback((_) {
      searchFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainController>();
    return Scaffold(
      body: Obx(() {
        if (controller.items.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.items.length,
          itemBuilder: (context, int index) {
            final item = controller.items[index];

            if (item is NavbarListItem) {
              return TopNavbarWidget(item: item);
            }
            if (item is SearchBarListItem) {
              return SearchBarWidget(item: item);
            }
            if (item is ContinueWatchingItem) {
              return ContinueWatchingWidget(item: item);
            }
            if (item is WatchingCardItem) {
              return WatchingCardWidget(item: item);
            }
            if (item is CategoriesItem) {
              return CategoriesWidget(item: item);
            }
            if (item is ToggleButtonHorizontalListItem) {
              return ToggleButtonHorizontalListWidget(item: item.item);
            }
            if (item is SuggestionsItem) {
              return SuggestionsWidget(item: item);
            }
            if (item is SuggestionsHorizontalListItem) {
              return SuggestionsHorizontalListWidget(item: item.item);
            }
            if (item is TopCoursesItem) {
              return TopCoursesWidget(item: item);
            }
            if (item is TopCoursesHorizontalListItem) {
              return TopCoursesHorizontalListWidget(item: item.item);
            }
            return const SizedBox.shrink();
          },
        );
      }),
    );
  }
}
