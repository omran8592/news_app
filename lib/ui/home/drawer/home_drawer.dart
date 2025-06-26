import 'package:flutter/material.dart';
import 'package:news_app/ui/home/drawer/section_drawer_item.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/assets_manager.dart';
class HomeDrawer extends StatelessWidget {
  Function onDrawerItemClicked;
  HomeDrawer({required this.onDrawerItemClicked});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          // padding: EdgeInsets.symmetric(
          //   vertical: height * 0.07
          // ),
          color: AppColors.whiteColor,
          width: double.infinity,
          height: height * 0.20,
          child: Text(
            'News App',
            textAlign: TextAlign.center,
            style: AppStyles.bold24Black,
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        InkWell(
          onTap: () {
            onDrawerItemClicked();
          },
          child: SectionDrawerItem(
              imagePath: AssetsManager.homeIcon, text: 'Go To Home'),
        ),
        Divider(
          color: AppColors.whiteColor,
          thickness: 2,
          indent: width * 0.04,
          endIndent: width * 0.06,
        ),
        SectionDrawerItem(imagePath: AssetsManager.themeIcon, text: 'Theme'),
        SizedBox(
          height: height * 0.02,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.04),
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.06, vertical: height * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.whiteColor, width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dark',
                style: AppStyles.medium20White,
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 30,
                color: AppColors.whiteColor,
              )
            ],
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Divider(
          color: AppColors.whiteColor,
          thickness: 2,
          indent: width * 0.04,
          endIndent: width * 0.06,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        SectionDrawerItem(
            imagePath: AssetsManager.languageIcon, text: 'Language'),
        SizedBox(
          height: height * 0.02,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.04),
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.06, vertical: height * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.whiteColor, width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'English',
                style: AppStyles.medium20White,
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 30,
                color: AppColors.whiteColor,
              )
            ],
          ),
        ),
      ],
    );
  }
}