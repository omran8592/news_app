import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:news_app/ui/home_screen.dart';
import 'package:news_app/ui/home/search/search_screen.dart';
import 'package:news_app/ui/home/providers/theme_provider.dart';
import 'package:news_app/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: HomeScreen.routeName,
            routes: {
              HomeScreen.routeName: (context) => const HomeScreen(),
              SearchScreen.routeName: (context) => const SearchScreen(),
            },
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
          );
        },
      ),
    );
  }
}
