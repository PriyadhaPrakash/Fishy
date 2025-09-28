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
          return Card(
            color: const Color(0xFF1E2A32),
            margin:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  // IMAGE
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: item["image"] != null
                        ? Image.network(
                      item["image"]!,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    )
                        : Container(
                      height: 60,
                      width: 60,
                      color: Colors.grey[800],
                      child: const Icon(Icons.image,
                          color: Colors.white54),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["name"] ?? "Unnamed",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          item["price"] ?? "",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Icon(Icons.favorite, color: Colors.red),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
