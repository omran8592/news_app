import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../model/category_model.dart';
import '../../../utils/app_colors.dart';

class CategoryFragment extends StatelessWidget {
  List<CategoryModel> categoriesList = [];
  Function onViewAllClicked;

  CategoryFragment({required this.onViewAllClicked});

  @override
  Widget build(BuildContext context) {
    categoriesList = CategoryModel.getCategoriesList(true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Good Morning\nHere is Some News For You',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  child: Stack(
                    alignment: index % 2 == 0
                        ? Alignment.bottomRight
                        : Alignment.bottomLeft,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(categoriesList[index].imagePath),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: width * 0.02,
                            vertical: height * 0.02),
                        child: ToggleSwitch(
                          customWidths: [width * 0.3, width * 0.18],
                          cornerRadius: 20.0,
                          activeBgColors: [
                            [Theme.of(context).primaryColor],
                            [AppColors.greyColor],
                          ],
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          initialLabelIndex: 1,
                          totalSwitches: 2,
                          customWidgets: [
                            SizedBox(
                              width: width * 0.3,
                              child: Center(
                                child: Text(
                                  'View All',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(fontSize: 20),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            const CircleAvatar(
                              radius: 32,
                              backgroundColor: AppColors.blackColor,
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: AppColors.whiteColor,
                                size: 24,
                              ),
                            )
                          ],
                          radiusStyle: true,
                          onToggle: (index1) {
                            onViewAllClicked(categoriesList[index]);
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: height * 0.02,
                );
              },
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}
