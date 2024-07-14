
import 'package:category_app2/bloc/category/category_bloc.dart';
import 'package:category_app2/bloc/details/details_bloc.dart';
import 'package:category_app2/bloc/meals/meals_bloc.dart';
import 'package:category_app2/constant.dart';
import 'package:category_app2/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/category/category_screen.dart';
import 'screens/details/details_screen.dart';
import 'screens/meals/meals_screen.dart';


class AppRouter {

  Route? generateRouter(RouteSettings settings) {

    switch (settings.name) {

      case AppRoutes.categories:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => CategoryBloc(categoryService: CategoryService())
              ..add(GetCategory()),
            child: const CategoriesScreen(),
          ),
        );
      case AppRoutes.meals:

          return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => MealsBloc(categoryName:settings.arguments as String )..add(Getitem()),
            child: const MealsScreen()),
          );
      case AppRoutes.details:

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (_) => DetailsBloc( mealId: settings.arguments as String, categoryName: settings.arguments as String )..add(GetDetails()),
              child: const DetailsScreen()),
        );
    }
   
  }
}
