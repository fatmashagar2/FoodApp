import 'package:category_app2/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TitleAll extends StatelessWidget {
  final String title;

  const TitleAll({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style:  TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w900,
          fontFamily: 'ProtestGuerrilla',
          color: AppColors.red,
          letterSpacing: 2.0,
          shadows: [
            Shadow(
              offset: Offset(4.0, 4.0),
              blurRadius: 3.0,
              color: Colors.black45,
            ),
          ],
        ),
      ),
    );
  }
}
