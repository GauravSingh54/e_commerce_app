import 'package:e_commerce_app/models/product_models.dart';
import 'package:e_commerce_app/screens/Details/widget/description.dart';
import 'package:e_commerce_app/screens/Details/widget/detail_app_bar.dart';
import 'package:e_commerce_app/screens/Details/widget/image_slider.dart';
import 'package:e_commerce_app/screens/Details/widget/item_details.dart';
import 'package:e_commerce_app/screens/Home/Widget/addto_cart.dart';
import 'package:e_commerce_app/screens/constants.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  int currentColor = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      //for add to cart, icon and quantity
      floatingActionButton:AddtoCart(product: widget.product) ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
          child: Column(
        children: [
          //for back button sahre and favourite
          const DetailAppBar(),
          //for detail image slider
          MyImageSlider(
            image: widget.product.image,
            onChange: (index) {
              setState(() {
                currentImage = index;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => AnimatedContainer(
                duration: const Duration(microseconds: 300),
                width: currentImage == index ? 15 : 8,
                height: 8,
                margin: const EdgeInsets.only(right: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:
                      currentImage == index ? Colors.black : Colors.transparent,
                  border: Border.all(color: Colors.black),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
            ),
            padding: const EdgeInsets.only(
                left: 20, right: 20, top: 20, bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //for product price rating name and seller
                ItemDetails(product: widget.product),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Color',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: List.generate(
                    widget.product.Colors.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          currentColor = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentColor == index
                              ? Colors.white
                              : widget.product.Colors[index],
                          border: currentColor == index
                              ? Border.all(
                                  color: widget.product.Colors[index],
                                )
                              : null,
                        ),
                        padding: currentColor == index
                            ? const EdgeInsets.all(2)
                            : null,
                        margin: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: widget.product.Colors[index],
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                 const SizedBox(
                  height: 20,
                ),
                //for description of the product
                Description( description: widget.product. description,)
              ],
            ),
          ),
        ],
      )),
    );
  }
}
