import 'package:category_app2/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class Search extends StatelessWidget {
  final Function(String) onSearch;

  const Search({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        onSearch(value);
      },
      decoration: const InputDecoration(
        hintText: 'Search For Meal',
        hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color:Color(0xffF54749)), // Red border
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Color(0xffF54749)), // Red border when focused
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Color(0xffF54749)), // Red border when enabled
        ),
      ),
    );
  }
}
