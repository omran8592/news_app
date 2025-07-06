import 'package:flutter/material.dart';

class SearchStateHandler extends StatelessWidget {
  final String message;

  const SearchStateHandler({required this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: Theme.of(context).textTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
