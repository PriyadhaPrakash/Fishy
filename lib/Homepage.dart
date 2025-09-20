import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> bannerImages = [
    'assets/fishy1.jpg',
    'assets/fishy1.jpg',
    'assets/fishy1.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10)),
          TextField(
            decoration: InputDecoration(
              hintText: "Search for fish...",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.zero),
            ),
          ),
          const SizedBox(height: 70),

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


        ],
      ),
    );
  }
}
