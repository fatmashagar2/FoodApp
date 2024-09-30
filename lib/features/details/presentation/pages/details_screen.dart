import 'package:category_app2/core/utils/app_colors.dart';
import 'package:category_app2/features/details/presentation/widgets/details_item.dart';
import 'package:category_app2/features/fav/data/model/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:category_app2/features/details/presentation/manager/bloc/details/details_bloc.dart';
import 'package:category_app2/features/retry_again/retry_again.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_plus/share_plus.dart';

class DetailsScreen extends StatefulWidget {
  final ValueNotifier<List<FavoriteItem>> favoritesNotifier;

  const DetailsScreen({
    super.key,
    required this.favoritesNotifier,
  });

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
  }

  void _updateFavoriteStatus(String title) {
    setState(() {
      isFavorite = widget.favoritesNotifier.value.any((item) => item.title == title);
    });
  }

  void _toggleFavorite(String title, String image) {
    try {
      setState(() {
        if (isFavorite) {
          widget.favoritesNotifier.value.removeWhere((item) => item.title == title);
        } else {
          widget.favoritesNotifier.value.add(FavoriteItem(title: title, imagePath: image));
        }
        isFavorite = !isFavorite;
        widget.favoritesNotifier.notifyListeners();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error while toggling favorite: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Details",
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),

      ),
      body: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) {
          if (state is DetailsLoading) {
            return  Center(child: SpinKitFadingCircle(color: AppColors.red, size: 50.0));
          } else if (state is DetailsSuccess) {
            final details = state.details!;
            final String youtubeLink = details[0].strYoutube ?? 'https://www.youtube.com';
            final String title = details[0].strMeal ?? 'No title';
            final String image = details[0].strMealThumb ?? '';
     WidgetsBinding.instance.addPostFrameCallback((_) {
              _updateFavoriteStatus(title);
            });

            return Stack(
              children: [
                DetailsItem(details: details),
                Positioned(
                  top: 30,
                  right: 16,
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black.withOpacity(0.6),
                        child: IconButton(
                          icon: Image.asset("assets/share.png", width: 30, height: 30),
                          onPressed: () {
                            Share.share('Check out this video: $youtubeLink');
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      CircleAvatar(
                        backgroundColor: Colors.black.withOpacity(0.6),
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              size: 25,
                              color: isFavorite ? Colors.red : Colors.white,
                            ),
                            onPressed: () {
                              _toggleFavorite(title, image);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: RetryWidget(
                onRetry: () async {
                  await Future.delayed(const Duration(seconds: 2));
                  print('Retry clicked');
                },
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    // Consider removing or using `_imagePath` if necessary
    super.dispose();
  }
}
