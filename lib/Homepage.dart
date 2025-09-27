import 'package:carousel_slider/carousel_slider.dart';
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
 final List<String> categories = [
    'Fresh Fish (Cleaned & Whole)',
    'Cut Fish in Packets',
    'Dried Fish',
    'Frozen Fish',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.black54),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search for fish...",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(Icons.mic, color: Colors.green.shade900),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 50),

          CarouselSlider(
            options: CarouselOptions(
              height: 200,

              autoPlay: true, // automatically slide
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
          const SizedBox(height: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Categories",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade900,
                ),
              ),const SizedBox(height: 30,)
            ],
          ),
          SizedBox(
            height: 85,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 100,
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        category, // <-- using the variable here
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),

                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
