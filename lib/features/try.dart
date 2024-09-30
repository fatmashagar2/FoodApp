
import 'dart:async';
import 'package:newtons_cradle_loading_indicator/newtons_cradle_loading_indicator.dart';
import 'package:category_app2/features/category/data/models/category_model.dart';
import 'package:category_app2/features/category/presentation/widgets/carousel_slider.dart';
import 'package:category_app2/features/category/presentation/widgets/category_items.dart';
import 'package:category_app2/features/category/data/services/category_services.dart';
import 'package:flutter/material.dart';

class FoodDeliveryHome extends StatelessWidget {
  final CategoryService _categoryService = CategoryService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(

          margin: EdgeInsets.all(10),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.all(Radius.circular(10),),
           color: Colors.red[100],
         ),

          child: Center(child: Text("=",style:TextStyle(color:Colors.red,fontSize:28),)),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/AdobeStock_133439746_Preview.jpeg', // Replace with your image URL
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  hintText: "Search your favorite food...",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: const Icon(Icons.grid_view, color: Colors.red),
                ),
              ),
              const SizedBox(height: 20),

              // Featured Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "The Fastest Food Delivery",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "Order Now",
                            style: TextStyle(color: Colors.red),
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
              ),
              const SizedBox(height: 20),

              // Categories
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis, // To avoid overflow
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 20),
              FutureBuilder<List<CategoryModel>>(
                future: _categoryService.getCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child:CircularProgressIndicator ());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No categories available'));
                  } else {
                    return CategoryItems(categories: snapshot.data!);
                  }
                },
              ),

              const SizedBox(height: 20),

              // Popular Today
              const Text(
                "Popular Today",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              CarouselSlider(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );

  }

}


