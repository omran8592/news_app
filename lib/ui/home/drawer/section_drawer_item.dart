import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';

class SectionDrawerItem extends StatelessWidget {
  String imagePath;

  String text;

  SectionDrawerItem({required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(imagePath),
            color: AppColors.whiteColor,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Text(
            text,
            style: AppStyles.bold20White,
          )
        ],
      ),
    );
  }
}
