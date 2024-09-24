import 'package:flutter/material.dart';

class Product{
  final String title;
  final String description;
  final String image;
  final String review;
  final String seller;
  final double price;
  final List<Color> Colors;
  final String category;
  final double rate;
  int quantity;

  Product(
    {required this.title,
      required this.review,
required this.description,
required this.image,
required this.price,
required this.Colors,
required this.seller,
required this.rate,
required this.category,
      required this.quantity,});
}

final List<Product> products = [
Product(
  title: ' Headphones',
  description: 'Easy to use',
  image: 'images/wireless.jpeg',
  price: 12000,
  seller: 'Apple',
  Colors: [
    Colors.black,
    Colors.blue,
    Colors.orange,
  ],
  category: 'Electronics',
  review: '(320 Reviews)',
  rate: 4.8,
  quantity: 1,
),
Product(
  title: 'Women Sweter',
  description: 'Comfortable to weare',
  image: 'images/sweter.jpeg',
  price: 1000,
  seller: 'IndianMART',
  Colors: [
    Colors.brown,
    Colors.deepPurple,
    Colors.pink,
  ],
  category: 'Women Fashion',
  review: '(15 Reviews)',
  rate: 4,
  quantity: 1,
),
Product(
  title: 'Smart Watch',
  description: 'Fashionable',
  image: 'images/watch.jpeg',
  price: 10000,
  seller: 'Ram Das',
  Colors: [
    Colors.black,
    Colors.amber,
    Colors.purple,
  ],
  category: 'Electronics',
  review: '(20 Reviews)',
  rate: 3.9,
  quantity: 1,
),
Product(
  title: 'Mens Jacket',
  description: 'Fashionable',
  image: 'images/jacket.jpg',
  price: 999,
  seller: 'Mohan',
  Colors: [
    Colors.blueAccent,
    Colors.orange,
    Colors.green,
  ],
  category: 'Fashion',
  review: '(200 Reviews)',
  rate: 4.9,
  quantity: 1,
),
];