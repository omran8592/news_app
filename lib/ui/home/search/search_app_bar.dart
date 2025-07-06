import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;
  final void Function(String) onChanged;

  const SearchAppBar({
    required this.controller,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      elevation: 0,
      backgroundColor: theme.scaffoldBackgroundColor,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(isDark ? 0.08 : 0.4),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: Transform(
                transform: Matrix4.skewX(-0.03),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Icon(Icons.search,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.blackColor),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: controller,
                        onChanged: onChanged,
                        autofocus: true,
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                        ),
                        cursorColor:
                        isDark ? Colors.white : Colors.black,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: isDark
                                ? AppColors.whiteColor.withOpacity(0.7)
                                : AppColors.blackColor.withOpacity(0.7),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close,
                          color: isDark
                              ? AppColors.whiteColor
                              : AppColors.blackColor),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
