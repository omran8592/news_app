import 'package:flutter/material.dart';
import 'package:news_app/ui/home/drawer/section_drawer_item.dart';
import 'package:news_app/ui/home/drawer/theme_bottom_sheet.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/assets_manager.dart';

class HomeDrawer extends StatelessWidget {
  final Function onDrawerItemClicked;
  const HomeDrawer({required this.onDrawerItemClicked, super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          color: AppColors.whiteColor,
          width: double.infinity,
          height: height * 0.20,
          child: Text('News App', style: AppStyles.bold24Black),
        ),
        SizedBox(height: height * 0.02),

        // Go to Home
        InkWell(
          onTap: () => onDrawerItemClicked(),
          child: SectionDrawerItem(
              imagePath: AssetsManager.homeIcon, text: 'Go To Home'),
        ),

        Divider(color: AppColors.whiteColor, thickness: 2, indent: width * 0.04, endIndent: width * 0.06),

        // Theme (with Bottom Sheet)
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              builder: (_) => ThemeBottomSheet(),
            );
          },
          child: SectionDrawerItem(
              imagePath: AssetsManager.themeIcon, text: 'Theme'),
        ),

        SizedBox(height: height * 0.02),

        Divider(color: AppColors.whiteColor, thickness: 2, indent: width * 0.04, endIndent: width * 0.06),

        SizedBox(height: height * 0.02),

        // Language
        SectionDrawerItem(imagePath: AssetsManager.languageIcon, text: 'Language'),

        SizedBox(height: height * 0.02),
      ],
    );
  }
}
