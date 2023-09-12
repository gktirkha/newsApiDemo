import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/news_response.dart';
import '../provider/news_provider.dart';
import 'widgets/news_list_tile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final StateNotifierProvider<NewsStateNotifier, NewsState> newsProvider =
      StateNotifierProvider<NewsStateNotifier, NewsState>((ref) => NewsStateNotifier());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsApp'),
        actions: [
          ChuckerFlutter.chuckerButton,
        ],
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            NewsState newsState = ref.watch(newsProvider);
            return (newsState is InitialNewsState || newsState is LoadingNewsState)
                ? const CircularProgressIndicator()
                : (newsState is ErrorNewsState)
                    ? Text(newsState.error)
                    : (newsState is LoadedState)
                        ? _buildList(newsState.newsResponse.articles)
                        : const Text('UnExpected');
          },
        ),
      ),
    );
  }

  Widget _buildList(List<Article> articles) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final Article article = articles[index];
        return NewsListTile(article: article);
      },
      itemCount: articles.length,
    );
  }
}
