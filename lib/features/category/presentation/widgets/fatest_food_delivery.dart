
import 'package:category_app2/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FatestFoodDelivery extends StatelessWidget {
  const FatestFoodDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color:  AppColors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                "The Fastest Food Delivery",
                style: TextStyle(
                  color:  AppColors.main,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:  AppColors.main,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child:  Text(
                  "Order Now",
                  style: TextStyle(color: AppColors.red),
                ),
              ),
            ],
          ),
          Image.asset(
            'assets/—Pngtree—sausage cheese pizza slice three-dimensional_13137250.png', // Replace with a plate image URL
            height: 100,
            width: 62,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
