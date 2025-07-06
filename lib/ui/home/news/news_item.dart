import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/ui/home/news/news_details_content.dart';

class NewsItem extends StatelessWidget {
  final News news;

  const NewsItem({required this.news, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
            ),
            child: NewsDetailsContent(
              news: news,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.015,
        ),
        padding: EdgeInsets.all(width * 0.03),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: theme.indicatorColor.withOpacity(0.4),
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                width: double.infinity,
                height: height * 0.25,
                fit: BoxFit.cover,
                imageUrl: news.urlToImage ?? '',
                placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                const Icon(Icons.broken_image),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              news.title ?? "",
              style: textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'By: ${news.author ?? "Unknown"}',
                    style: textTheme.labelMedium,
                  ),
                ),
                Text(
                  news.publishedAt?.substring(0, 10) ?? "",
                  style: textTheme.labelMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}