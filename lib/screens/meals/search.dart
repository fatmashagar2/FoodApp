import 'package:flutter/material.dart';

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
        hintText: 'Search',
        hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
        icon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
