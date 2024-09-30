import 'package:flutter/material.dart';
import 'package:category_app2/features/search/presentation/pages/search.dart';

class SearchBarr extends StatelessWidget {
  final Function(String) onSearch;

  const SearchBarr({Key? key, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Search(onSearch: onSearch),
    );
  }
}
