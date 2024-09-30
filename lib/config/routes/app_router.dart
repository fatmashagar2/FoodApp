import 'package:category_app2/constant.dart';
import 'package:category_app2/features/category/presentation/manager/bloc/category/category_bloc.dart';
import 'package:category_app2/features/details/presentation/manager/bloc/details/details_bloc.dart';
import 'package:category_app2/features/meals/presentation/manager/bloc/meals/meals_bloc.dart';
import 'package:category_app2/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/category/presentation/pages/category_screen.dart';
import 'features/details/presentation/pages/details_screen.dart';
import 'features/meals/presentation/pages/meals_screen.dart';


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
