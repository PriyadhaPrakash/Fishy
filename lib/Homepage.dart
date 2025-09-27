import 'package:carousel_slider/carousel_slider.dart';
import 'package:fishy/favourites.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> bannerImages = [
    'assets/banner1.jpg',
    'assets/banner1.jpg',
    'assets/banner1.jpg',
  ];

  final List<Map<String, String>> categories = [
    {"name": "Salmon", "price": "\$25/kg"},
    {"name": "Tuna", "price": "\$20/kg"},
    {"name": "Cod", "price": "\$15/kg"},
    {"name": "Shrimp", "price": "\$18/kg"},
    {"name": "Salmon", "price": "\$25/kg"},
    {"name": "Tuna", "price": "\$20/kg"},
    {"name": "Cod", "price": "\$15/kg"},
    {"name": "Shrimp", "price": "\$18/kg"},
  ];
  List<Map<String, String>> favoriteList = [];
  List<bool> isFavorite = [];

  @override
  void initState() {
    super.initState();
    // Initialize isFavorite list
    isFavorite = List<bool>.filled(categories.length, false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151F24),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        children: [
          const SizedBox(height: 20),

          // 🔹 Banner Carousel
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: .9,
              autoPlayInterval: const Duration(seconds: 3),
            ),
            items: bannerImages.map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),

          const SizedBox(height: 30),

          // 🔹 Title
          const Text(
            "Categories",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),

          // 🔹 Grid of categories with name & price below each card
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 20,
              children: List.generate(categories.length, (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        // 🔹 Card
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 4,
                          child: Container(
                            height: 100,
                            width: double.infinity,

                          ),
                        ),


                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon:  Icon(
                                isFavorite[index]
                                  ? Icons.favorite
                                  : Icons.favorite_border,),
                              color: isFavorite[index] ? Colors.red : Colors.grey,
                              iconSize: 20,
                              onPressed: () {

                                setState(() {
                                  isFavorite[index] = !isFavorite[index];
                                  if (isFavorite[index]) {
                                    favoriteList.add(categories[index]);
                                  } else {
                                    favoriteList.remove(categories[index]);
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),

                    // Name below the card
                    Expanded(
                      child: Text(
                        categories[index]["name"]!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 0),
                    Expanded(
                      child: Text(
                        categories[index]["price"]!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
