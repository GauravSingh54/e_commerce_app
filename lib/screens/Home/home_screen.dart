import 'package:e_commerce_app/models/product_models.dart';
import 'package:e_commerce_app/screens/Home/Widget/category.dart';
import 'package:e_commerce_app/screens/Home/Widget/image_slider.dart';
import 'package:e_commerce_app/screens/Home/Widget/product_cart.dart';
import 'package:e_commerce_app/screens/Home/Widget/search_bar.dart';
import 'package:flutter/material.dart';

import 'Widget/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 35,
              ),
              //for custom appbar
              const CustomAppBar(),
              const SizedBox(
                height: 20,
              ),
              //for search bar
              const MySearchBAR(),
              const SizedBox(
                height: 20,
              ),
              //for image slider
              ImageSlider(
                currentSlid: currentSlider,
                onChanged: (value) {
                  setState(
                    () {
                      currentSlider = value;
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              //for catagory selection
              const Category(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Special For You',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                  // SizedBox(width: 14,)
                ],
              ),
              // for shopping items
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.78,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductCart(
                      product: products[index],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
