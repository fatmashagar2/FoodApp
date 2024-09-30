import 'package:category_app2/features/category/presentation/pages/category_screen.dart';
import 'package:category_app2/features/fav/data/model/favorite_item.dart';
import 'package:flutter/material.dart';

class CategoryScreenWrapper extends StatefulWidget {
  final ValueNotifier<List<FavoriteItem>> favoritesNotifier;

  const CategoryScreenWrapper({Key? key, required this.favoritesNotifier}) : super(key: key);

  @override
  _CategoryScreenWrapperState createState() => _CategoryScreenWrapperState();
}

class _CategoryScreenWrapperState extends State<CategoryScreenWrapper> {
  bool _seeAllPressed = false;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.favoritesNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    widget.favoritesNotifier.dispose();
    super.dispose();
  }

  void _onPageIndexChanged(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  void _onSeeAllPressed() {
    setState(() {
      _seeAllPressed = !_seeAllPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CategoryScreen(
      favoritesNotifier: widget.favoritesNotifier,

    );
  }
}
