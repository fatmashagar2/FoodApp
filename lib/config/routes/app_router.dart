import 'package:category_app2/features/authentication/login/presentaion/pages/login_page.dart';
import 'package:category_app2/features/authentication/register/presentaion/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:category_app2/features/category/data/models/category_model.dart';
import 'package:category_app2/features/category/presentation/pages/category_screen.dart';
import 'package:category_app2/features/details/presentation/pages/details_screen.dart';
import 'package:category_app2/features/on_boarding_screens/pages/on_boarding_screens.dart';
import 'package:category_app2/features/splash/pages/splash_screen.dart';
import 'package:category_app2/features/category/data/services/category_services.dart';
import 'package:category_app2/features/category/presentation/manager/bloc/category/category_bloc.dart';
import 'package:category_app2/features/meals/presentation/manager/bloc/meals/meals_bloc.dart';
import 'package:category_app2/features/details/presentation/manager/bloc/details/details_bloc.dart';
import 'package:category_app2/core/utils/routes.dart';
import 'package:category_app2/features/fav/data/model/favorite_item.dart';
import 'package:category_app2/features/meals/presentation/pages/meals_screen.dart';
import 'package:category_app2/features/fav/presentation/pages/favorites_page.dart';

class AppRouter {
  final ValueNotifier<List<FavoriteItem>> favoritesNotifier;

  AppRouter({required this.favoritesNotifier});

  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.categories:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => CategoryBloc(categoryService: CategoryService())
              ..add(GetCategory()),
            child: CategoryScreen(
              favoritesNotifier: favoritesNotifier,
            ),
          ),
        );
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case AppRoutes.onboarding:
        return MaterialPageRoute(
          builder: (_) => OnboardingScreen(),
        );
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
      case AppRoutes.favorites:
        return MaterialPageRoute(
          builder: (_) => FavoritesPage(favoritesNotifier: favoritesNotifier),
        );
      case AppRoutes.register:
        return MaterialPageRoute(
          builder: (_) => RegisterPage(),
        );
      case AppRoutes.meals:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => MealsBloc(categoryName: settings.arguments as String)
              ..add(Getitem()), // Adjusted event name if needed
            child: MealsScreen(),
          ),
        );
      case AppRoutes.details:
        final args = settings.arguments as Map<String, String>;
        final mealId = args['mealId'] ?? '';
        final categoryName = args['categoryName'] ?? '';
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => DetailsBloc(
              mealId: mealId,
              categoryName: categoryName,
            )..add(GetDetails()),
            child: DetailsScreen(favoritesNotifier: favoritesNotifier),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
