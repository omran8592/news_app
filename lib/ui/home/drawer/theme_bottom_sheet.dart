import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_colors.dart';
import '../providers/theme_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: isDark ? AppColors.greyColor : AppColors.whiteColor,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(
              Icons.wb_sunny_outlined,
              color: isDark ?  AppColors.whiteColor: AppColors.blackColor,
            ),
            title: Text(
              'Light Theme',
              style: TextStyle(
                color: isDark ?  AppColors.whiteColor: AppColors.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              provider.setThemeMode(ThemeMode.light);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.nightlight_outlined,
              color: isDark ?  AppColors.whiteColor: AppColors.blackColor,
            ),
            title: Text(
              'Dark Theme',
              style: TextStyle(
                color: isDark ?  AppColors.whiteColor: AppColors.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              provider.setThemeMode(ThemeMode.dark);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
