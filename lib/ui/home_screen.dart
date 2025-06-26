import 'package:flutter/material.dart';
import 'package:news_app/ui/home/category/category_details.dart';
import '../model/category_model.dart';
import '../utils/app_colors.dart';
import 'home/category/category_fragment.dart';
import 'home/drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? 'Home' : selectedCategory!.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      drawer: Drawer(
        child: HomeDrawer(
          onDrawerItemClicked: onDrawerItemClicked,
        ),
        backgroundColor: AppColors.blackColor,
      ),
      body: selectedCategory == null
          ? CategoryFragment(
        onViewAllClicked: onViewAllClicked,
      )
          : CategoryDetails(
        category: selectedCategory!,
      ),
    );
  }

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
}