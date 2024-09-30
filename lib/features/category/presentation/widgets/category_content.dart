import 'package:category_app2/core/utils/app_colors.dart';
import 'package:category_app2/core/utils/app_strings.dart';
import 'package:category_app2/features/category/data/models/category_model.dart';
import 'package:category_app2/features/category/data/services/category_services.dart';
import 'package:category_app2/features/category/presentation/widgets/category_items.dart';
import 'package:category_app2/features/category/presentation/widgets/carousel_slider.dart';
import 'package:category_app2/features/fav/data/model/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CategoryContent extends StatelessWidget {
  final ValueNotifier<List<FavoriteItem>> favoritesNotifier;
  final bool seeAllPressed;
  final VoidCallback onSeeAllPressed;

  const CategoryContent({
    Key? key,
    required this.favoritesNotifier,
    required this.seeAllPressed,
    required this.onSeeAllPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CategoryService _categoryService = CategoryService();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStrings.categories,
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),

            ),
            GestureDetector(
              onTap: onSeeAllPressed,
              child: Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text(
                  seeAllPressed ? AppStrings.hideAll : AppStrings.seeAll,
                  style: TextStyle(
                    color:  AppColors.red,
                    fontSize: 16,
                    fontFamily: 'Pacifico',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // This is the scrollable section
        Expanded(
          child: FutureBuilder<List<CategoryModel>>(
            future: _categoryService.getCategories(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: SpinKitFadingCircle(color:  AppColors.red, size: 50.0));
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No categories available'));
              } else {
                final categoriesToShow = seeAllPressed
                    ? snapshot.data!
                    : snapshot.data!.take(3).toList();

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      CategoryItems(categories: categoriesToShow),
                      if (!seeAllPressed)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Image.asset(
                            AppStrings.food,
                            height: 120,
                          ),
                        ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
