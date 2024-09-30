import 'package:category_app2/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:category_app2/features/category/presentation/manager/bloc/category/category_bloc.dart';
import 'package:category_app2/features/category/presentation/widgets/category_content.dart';
import 'package:category_app2/features/fav/presentation/pages/favorites_page.dart';
import 'package:category_app2/features/fav/data/model/favorite_item.dart';
import 'package:category_app2/features/retry_again/retry_again.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../../../core/utils/app_strings.dart';

class CategoryScreen extends StatefulWidget {
  final ValueNotifier<List<FavoriteItem>> favoritesNotifier;

  const CategoryScreen({
    Key? key,
    required this.favoritesNotifier,
  }) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int pageIndex = 0;
  bool seeAllPressed = false;

  void _onPageIndexChanged(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  void _toggleSeeAll() {
    setState(() {
      seeAllPressed = !seeAllPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar( centerTitle: true,
        backgroundColor: AppColors.main,
        leading: pageIndex == 0
            ? Image.asset("assets/walk.gif", width: 40, height: 40)
            : pageIndex == 1
            ? Image.asset("assets/heart-love.gif", width: 40, height: 40)
               : null,
        title: pageIndex==1 ?Text("Favorites", style: TextStyle(
fontWeight: FontWeight.bold,
          fontFamily: 'Pacifico',
          fontSize: 24
        ),)
      :null),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return Center(child: SpinKitFadingCircle(color: AppColors.red, size: 50.0));
          } else if (state is CategorySuccess) {
            if (pageIndex == 0) {
              return CategoryContent(
                favoritesNotifier: widget.favoritesNotifier,
                seeAllPressed: seeAllPressed,
                onSeeAllPressed: _toggleSeeAll,
              );
            } else if (pageIndex == 1) {
              return FavoritesPage(favoritesNotifier: widget.favoritesNotifier);
                } else {
              return Center(
                child: RetryWidget(
                  onRetry: () async {
                    await Future.delayed(Duration(seconds: 2));
                    print('Retry clicked');
                  },
                ),
              );
            }
          } else {
            return Center(
              child: RetryWidget(
                onRetry: () async {
                  print("Retry clicked");
                },
              ),
            );
          }
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: pageIndex,
        height: 60.0,
        items:  <Widget>[
          Icon(Icons.home, size: 30, color: AppColors.main),
          Icon(Icons.favorite, size: 30, color: AppColors.main),
              ],
        color: AppColors.red,
        buttonBackgroundColor: AppColors.red,
        backgroundColor:  AppColors.main,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: _onPageIndexChanged,
      ),
    );
  }
}