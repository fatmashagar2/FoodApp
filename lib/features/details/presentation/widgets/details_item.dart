import 'package:category_app2/features/details/presentation/widgets/detaols_image_section.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:category_app2/features/details/data/models/details_model.dart';
import 'package:category_app2/features/details/presentation/widgets/details_content.dart';

class DetailsItem extends StatelessWidget {
  const DetailsItem({
    Key? key,
    required this.details,
  }) : super(key: key);

  final List<DetailsModel> details;

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final detailsModel = details[0];

    return Scaffold(
      body: LiquidPullToRefresh(
        onRefresh: onRefresh,
        color: Colors.black,
        backgroundColor: Colors.white,
        height: 100,
        child: Column(
          children: [
            DetailsImageSection(
              imageUrl: detailsModel.strMealThumb!,
              youtubeUrl: detailsModel.strYoutube,
              onLaunchURL: _launchURL,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: DetailsContent(
                    mealName: detailsModel.strMeal ?? '',
                    category: detailsModel.strCategory ?? '',
                    area: detailsModel.strArea ?? '',
                    ingredients: detailsModel.ingredients!,
                    measures: detailsModel.measures!,
                    instructions: detailsModel.strInstructions ?? '',
                    tags: detailsModel.strTags ?? 'No tags available',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
