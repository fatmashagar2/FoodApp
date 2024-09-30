import 'package:category_app2/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';

class NoFavoritesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:AppColors.main,
   body: Center(
          child: Image.asset(AppStrings.noFav, width: 150, height: 150),
        )
    );
  }
}
