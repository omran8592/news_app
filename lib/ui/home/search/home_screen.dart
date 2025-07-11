import 'package:flutter/material.dart';
import 'package:news_app/ui/home/category/category_details.dart';
import 'package:news_app/ui/home/category/category_fragment.dart';
import 'package:news_app/ui/home/drawer/home_drawer.dart';
import 'package:news_app/ui/home/search/search_screen.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/model/category_model.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;

  void onViewAllClicked(CategoryModel newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void onDrawerItemClicked() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final title = selectedCategory?.title ?? 'Home';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SearchScreen()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(onDrawerItemClicked: onDrawerItemClicked),
      ),
      body: selectedCategory == null
          ? CategoryFragment(onViewAllClicked: onViewAllClicked)
          : CategoryDetails(category: selectedCategory!),
    );
  }
}
