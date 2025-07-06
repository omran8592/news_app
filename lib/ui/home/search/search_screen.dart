import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/ui/home/search/search_app_bar.dart';
import 'package:news_app/ui/home/search/search_results_list.dart';
import 'package:news_app/ui/home/search/search_state_handler.dart';
import 'dart:async';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'search_screen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  List<News>? results;
  bool loading = false;
  String error = '';
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _search("egypt");
  }

  void _search(String query) async {
    if (query.trim().isEmpty) return;

    setState(() {
      loading = true;
      error = '';
    });

    try {
      final response = await ApiManager.searchNews(query);
      if (response?.status == 'ok') {
        setState(() => results = response?.articles);
      } else {
        setState(() => error = response?.message ?? 'Unknown error');
      }
    } catch (_) {
      setState(() => error = 'Something went wrong');
    } finally {
      setState(() => loading = false);
    }
  }

  void _searchDebounced(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      _search(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        controller: searchController,
        onChanged: _searchDebounced,
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : error.isNotEmpty
          ? SearchStateHandler(message: error)
          : results == null
          ? const SearchStateHandler(message: 'Search for news...')
          : SearchResultsList(results: results!),
    );
  }
}
