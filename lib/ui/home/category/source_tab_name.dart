import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';

class SourceTabName extends StatelessWidget {
Sources sources;
bool isSelected ;
SourceTabName({required this.sources,required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Text(sources.name??"",
      style:isSelected?Theme.of(context).textTheme.labelLarge:
      Theme.of(context).textTheme.labelMedium,);
  }
}
