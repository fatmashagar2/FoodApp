import 'package:flutter/material.dart';

class TagsSection extends StatelessWidget {
  const TagsSection({
    Key? key,
    required this.tags,
  }) : super(key: key);

  final String tags;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        'Tags: $tags',
        style: const TextStyle(fontSize: 16.0, color: Colors.blueGrey),
      ),
    );
  }
}
