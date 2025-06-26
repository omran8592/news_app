import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/ui/home/category/source_tab_widget.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import '../../../model/SourceResponse.dart';
import '../../../model/category_model.dart';
class CategoryDetails extends StatefulWidget {
  final CategoryModel category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future: ApiManager.getSources(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.greyColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                'Something went wrong.',
                style: AppStyles.medium20Black,
              ),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getSources(widget.category.id);
                },
                child: Text(
                  "Try Again",
                  style: AppStyles.medium20Black,
                ),
              )
            ],
          );
        }

        if (snapshot.data!.status != 'ok') {
          return Column(
            children: [
              Text(
                snapshot.data!.message ?? 'Error',
                style: AppStyles.medium20Black,
              ),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getSources(widget.category.id);
                  setState(() {});
                },
                child: Text(
                  "Try Again",
                  style: AppStyles.medium20Black,
                ),
              )
            ],
          );
        }

        var sourcesList = snapshot.data?.sources ?? [];
        return SourceTabWidget(sourcesList: sourcesList);
      },
    );
  }
}
