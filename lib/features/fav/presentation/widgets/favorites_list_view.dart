import 'package:category_app2/core/utils/app_colors.dart';
import 'package:category_app2/features/fav/data/model/favorite_item.dart';
import 'package:category_app2/features/fav/presentation/widgets/favorite_item_tile.dart';
import 'package:flutter/material.dart';

class FavoritesListView extends StatelessWidget {
  final List<FavoriteItem> favorites;
  final ValueNotifier<List<FavoriteItem>> favoritesNotifier;

  const FavoritesListView({
    super.key,
    required this.favorites,
    required this.favoritesNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.main,
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final item = favorites[index];
          return FavoriteItemTile(
            item: item,
            onRemove: () {
              favoritesNotifier.value.removeAt(index);
              favoritesNotifier.notifyListeners();
            },
          );
        },
      ),
    );
  }
}

