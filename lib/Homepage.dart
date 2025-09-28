import 'package:carousel_slider/carousel_slider.dart';
import 'package:fishy/ProductPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List<Map<String, String>> favoriteList;
  final Function(Map<String, String>) onToggleFavorite;

  const HomePage({
    super.key,
    required this.favoriteList,
    required this.onToggleFavorite,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> favoriteList = [];

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
  ];

  List<bool> isFavorite = [];

  @override
  void initState() {
    super.initState();
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

          // Banner Carousel
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

          const Text(
            "Categories",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 20,
              childAspectRatio: 0.9, // <-- control height vs width
              children: List.generate(categories.length, (index) {
                final item = categories[index];
                return Column(
                  mainAxisSize: MainAxisSize.min, // <-- prevents overflow
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        // White card clickable
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailsPage(product: item),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 4,
                            child: Container(
                              height: 100,
                              width: double.infinity,
                            ),
                          ),
                        ),

                        // Favorite button
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(
                                isFavorite[index]
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                              ),
                              color:
                              isFavorite[index] ? Colors.red : Colors.grey,
                              iconSize: 20,
                              onPressed: () {
                                widget.onToggleFavorite(item);
                                setState(() {
                                  isFavorite[index] = !isFavorite[index];
                                  if (isFavorite[index]) {
                                    favoriteList.add(item);
                                  } else {
                                    favoriteList.remove(item);
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    Text(
                      item["name"]!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      item["price"]!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
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
