import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/news/news_item.dart';
import 'package:news_app/utils/app_styles.dart';
import '../../../utils/app_colors.dart';

class NewsWidget extends StatefulWidget {
  Sources source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.greyColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text(
                  'Something went wrong.',
                  style:  Theme.of(context).textTheme.headlineLarge,
                ),
                ElevatedButton(
                  onPressed: () {
                    ApiManager.getNewsBySourceId(widget.source.id ?? "");
                    setState(() {

                    });
                  },
                  child: Text(
                    'Try Again',
                    style:  Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ],
            )
          );
        }
        if (snapshot.data!.status != 'ok'){
          return Center(
              child: Column(
                children: [
                  Text(
                    snapshot.data!.message!,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourceId(widget.source.id ?? "");
                      setState(() {

                      });
                    },
                    child: Text(
                      'Try Again',
                      style:  Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ],
              )
          );
        }
        var newsList = snapshot.data!.articles!;
        return ListView.builder(
                   itemBuilder: (context, index) {
                     return NewsItem(news: newsList[index]);
                   },
                   itemCount: newsList.length,
                 );
      },
    );
  }
}
