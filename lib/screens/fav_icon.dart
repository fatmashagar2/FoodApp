
import 'package:category_app2/bloc/meals/meals_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColoredHeartIcon extends StatelessWidget {
  final String mealId;

  ColoredHeartIcon({required this.mealId});

  @override
  Widget build(BuildContext context) {
    print(context.widget);
  return GestureDetector(
      onTap: () {
        context.read<MealsBloc>().add(ToggleFavorite(mealId: mealId));
        print(context);
      } ,child: BlocBuilder<MealsBloc, MealsState>(
        builder: (context, state) {
          if (state is MealsSuccess) {
            final isLiked = state.favoriteMealIds.contains(mealId);
            return Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  Icons.favorite,
                  color: Colors.grey,
                  size: 32.0,
                ),
                if (isLiked)
                  const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 32.0,
                  ),
              ],
            );
          } else {
            return const Icon(
              Icons.heart_broken_sharp,
              color: Colors.grey,
              size: 32.0,
            );
          }
        },
      ),
    );
  }
}
