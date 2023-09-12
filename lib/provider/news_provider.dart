import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/news_response.dart';
import '../service/api_service.dart';

@immutable
abstract class NewsState {
  const NewsState();
}

@immutable
class InitialNewsState extends NewsState {
  const InitialNewsState();
}

@immutable
class LoadingNewsState extends NewsState {
  const LoadingNewsState();
}

@immutable
class LoadedState extends NewsState {
  const LoadedState({required this.newsResponse});
  final NewsResponse newsResponse;
}

@immutable
class ErrorNewsState extends NewsState {
  const ErrorNewsState(this.error);
  final String error;
}

class NewsStateNotifier extends StateNotifier<NewsState> {
  NewsStateNotifier() : super(const InitialNewsState()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = const LoadingNewsState();
    late NewsResponse newsResponse;
    try {
      newsResponse = await ApiService.getResponse();
      state = LoadedState(newsResponse: newsResponse);
    } catch (e) {
      state = ErrorNewsState(e.toString());
    }
  }
}
