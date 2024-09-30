import 'package:category_app2/core/utils/app_strings.dart';
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
        if (favorites.isEmpty) {
          return Center(
            child: Image.asset(AppStrings.noFav,width:150,height:150),
          );
        }

        return ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final item = favorites[index];
            return ListTile(
              leading: Image.network(item.imagePath, width: 50, height: 50),
              title: Text(item.title),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle, color: Colors.red),
                onPressed: () {
                  // Remove item from favorites
                  favoritesNotifier.value.removeAt(index);
                  favoritesNotifier.notifyListeners();
                },
              ),
            );
          },
        );
      },
    );
  }
}
