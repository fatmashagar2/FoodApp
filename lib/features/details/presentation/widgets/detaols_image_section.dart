import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utils/app_strings.dart';

class DetailsImageSection extends StatelessWidget {
  const DetailsImageSection({
    Key? key,
    required this.imageUrl,
    required this.youtubeUrl,
    required this.onLaunchURL,
  }) : super(key: key);

  final String imageUrl;
  final String? youtubeUrl;
  final Future<void> Function(String url) onLaunchURL;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 250,
          ),
        ),
        if (youtubeUrl != null && youtubeUrl!.isNotEmpty)
          Positioned.fill(
            child: Center(
              child: GestureDetector(
                onTap: () => onLaunchURL(youtubeUrl!),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.black.withOpacity(0.3),
                  child: Center(
                    child: Image.asset(
                      AppStrings.youtube,
                      width: 60,
                      height: 70,
                    ),
                  ),
                ),
              ),
            ),
          ),

      ],
    );
  }
}
