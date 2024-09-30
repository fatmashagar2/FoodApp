import 'package:category_app2/features/fav/presentation/widgets/favorites_list_view.dart';
import 'package:category_app2/features/fav/presentation/widgets/no_favorites_widget.dart';
import 'package:flutter/material.dart';
import 'package:category_app2/features/fav/data/model/favorite_item.dart';

class FavoritesPage extends StatelessWidget {
  final ValueNotifier<List<FavoriteItem>> favoritesNotifier;
  const FavoritesPage({
    super.key,
    required this.favoritesNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<FavoriteItem>>(
      valueListenable: favoritesNotifier,
      builder: (context, favorites, child) {
        return favorites.isEmpty
            ? NoFavoritesWidget()
            : FavoritesListView(
          favorites: favorites,
          favoritesNotifier: favoritesNotifier,
        );
      },
    );
  }
}


