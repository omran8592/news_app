import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/ui/home/news/full_article_screen.dart';
import 'package:news_app/utils/app_colors.dart';

class NewsDetailsContent extends StatelessWidget {
  final News news;

  const NewsDetailsContent({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDark = brightness == Brightness.dark;

    final backgroundColor =
    isDark ? AppColors.whiteColor : AppColors.blackColor;
    final textColor =
    isDark ? AppColors.blackColor : AppColors.whiteColor;
    final buttonColor =
    isDark ? AppColors.blackColor : AppColors.whiteColor;
    final buttonTextColor =
    isDark ? AppColors.whiteColor : AppColors.blackColor;

    final textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        top: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (news.urlToImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  news.urlToImage!,
                  height: height * 0.25,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16),
            Text(
              news.title ?? '',
              style: textTheme.headlineLarge?.copyWith(color: textColor),
            ),
            const SizedBox(height: 12),
            Text(
              news.description ?? '',
              style: textTheme.labelMedium?.copyWith(color: textColor),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          FullArticleScreen(url: news.url ?? ""),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'View Full Article',
                  style: textTheme.labelLarge?.copyWith(
                    color: buttonTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
