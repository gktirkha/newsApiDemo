import 'package:flutter/material.dart';
import '../../model/news_response.dart';

class NewsListTile extends StatelessWidget {
  const NewsListTile({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text.rich(
        TextSpan(
          children: [
            const TextSpan(
              text: 'Title: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: article.title),
          ],
        ),
      ),
      subtitle: Text.rich(
        TextSpan(
          children: [
            const TextSpan(
              text: 'Sub Title: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: article.description ?? 'Not Provided'),
          ],
        ),
      ),
      trailing: Text.rich(
        TextSpan(
          children: [
            const TextSpan(
              text: 'Source: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: article.source?.name ?? 'Not Provided'),
          ],
        ),
      ),
    );
  }
}
