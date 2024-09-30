import 'package:category_app2/features/category/data/models/category_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CategoryItems extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoryItems({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // This prevents the GridView from expanding infinitely
      physics: NeverScrollableScrollPhysics(), // Disable scrolling in GridView
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of items per row
        crossAxisSpacing: 8.0, // Horizontal spacing between items
        mainAxisSpacing: 8.0, // Vertical spacing between items
        childAspectRatio: 1, // Aspect ratio of each item
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/meals',
              arguments: category.name,
            );
            print(category.name);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                category.thumbnailUrl,
                height: 80,
                width: 80,
              ),
              Expanded(
                child: Text(
                 
                  category.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.red,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
