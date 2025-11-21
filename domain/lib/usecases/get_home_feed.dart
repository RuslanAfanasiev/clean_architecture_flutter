import 'package:domain/entities/home_feed.dart';
import 'package:domain/repositories/feed_repository.dart';

class GetHomeFeed {
  final FeedRepository repository;

  const GetHomeFeed(this.repository);

  Future<HomeFeed> call() {
    return repository.getHomeFeed();
  }
}

