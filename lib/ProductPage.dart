import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final Map<String, String> product;
  final void Function(Map<String, String>)? onAddToCart;

  const ProductDetailsPage({
    super.key,
    required this.product,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151F24),
      appBar: AppBar(
        backgroundColor: const Color(0xFF151F24),
        title: Text(product['name'] ?? 'Product',
            style: const TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE
            product['image'] != null
                ? (product['image']!.startsWith('assets/')
                ? Image.asset(product['image']!, height: 200)
                : Image.network(product['image']!, height: 200))
                : Container(
              height: 200,
              color: Colors.grey[800],
              child: const Icon(Icons.image,
                  size: 100, color: Colors.white54),
            ),
            const SizedBox(height: 20),

            // NAME
            Text(
              product['name'] ?? "Unnamed",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // PRICE
            Text(
              product['price'] ?? "",
              style: const TextStyle(color: Colors.grey, fontSize: 18),
            ),

            const SizedBox(height: 20),

            // DESCRIPTION
            Text(
              product['desc'] ?? "No description",
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),

            const Spacer(),

            // ADD TO CART
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                label: const Text("Add to Cart",
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, padding: const EdgeInsets.all(16)),
                onPressed: () {
                  if (onAddToCart != null) {
                    onAddToCart!(product);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Added to cart")),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
