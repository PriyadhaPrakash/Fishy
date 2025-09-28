import 'package:flutter/material.dart';

class FavoPage extends StatelessWidget {
  final List<Map<String, String>> favoriteList;

  const FavoPage({super.key, required this.favoriteList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151F24),
      appBar: AppBar(
        backgroundColor: const Color(0xFF151F24),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Favourites",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: false,
      ),
      body: favoriteList.isEmpty
          ? const Center(
        child: Text(
          "No favourites yet",
          style: TextStyle(color: Colors.white),
        ),
      )
          : ListView.builder(
        itemCount: favoriteList.length,
        itemBuilder: (context, index) {
          final item = favoriteList[index];
          return ListTile(
            title: Text(
              item["name"]!,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              item["price"]!,
              style: const TextStyle(color: Colors.grey),
            ),
            leading: const Icon(Icons.favorite, color: Colors.red),
          );
        },
      ),
    );
  }
}