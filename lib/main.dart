
import 'package:category_app2/features/authentication/auth_cubit/auth_cubit.dart';
import 'package:category_app2/features/authentication/login/presentaion/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/routes/app_router.dart';
import 'package:category_app2/core/utils/routes.dart';
import 'features/authentication/register/presentaion/pages/register_page.dart';
import 'features/fav/data/model/favorite_item.dart';
import 'features/splash/pages/splash_screen.dart'; // Import SplashScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  final favoritesNotifier = ValueNotifier<List<FavoriteItem>>([]);

  runApp(MyApp(
    isFirstTime: isFirstTime,
    favoritesNotifier: favoritesNotifier,
  ));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;
  final ValueNotifier<List<FavoriteItem>> favoritesNotifier;

  const MyApp({
    super.key,
    required this.isFirstTime,
    required this.favoritesNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>AuthCubit())
      
    ], child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      onGenerateRoute: (settings) {
        return AppRouter(favoritesNotifier: favoritesNotifier).generateRouter(settings);
      },
    ));
  }
}
