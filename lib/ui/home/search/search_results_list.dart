import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/ui/home/news/news_item.dart';

class SearchResultsList extends StatelessWidget {
  final List<News> results;

  const SearchResultsList({required this.results, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: results.length,
      itemBuilder: (context, index) => NewsItem(news: results[index]),
    );
  }
}
