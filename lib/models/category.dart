class category {
  final String title;
  final String image;

  category({
    required this.title,
    required this.image,
  });
}

final List<category> categories = [
  category(
    title: 'Shoes', 
    image: 'images/shoes.jpeg'),
     category(
    title: 'Beauty', 
    image: 'images/beauty.jpeg'),
     category(
    title: 'women\nFashion', 
    image: 'images/image1.jpeg'),
     category(
    title: 'Jewelry', 
    image: 'images/jewelry.jpeg'),
     category(
    title: 'Sports', 
    image: 'images/sports.jpeg'),
     category(
    title: 'men\nFashion', 
    image: 'images/men.jpeg'),
];
