import 'package:fishy/Cart.dart';
import 'package:flutter/material.dart';

// Global cartList already exists in Cart.dart
// List<CartItem> cartList = [];

class ProductDetailsPage extends StatelessWidget {
  final Map<String, String> product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  void addToCart(Map<String, String> product) {
    // Check if product already exists in cart
    final index = cartList.indexWhere((item) => item.name == product['name']);
    if (index != -1) {
      cartList[index].quantity++;
    } else {
      cartList.add(CartItem(
        name: product['name']!,
        price: product['price']!,
        image: product['image'] ?? '',
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151F24),
      appBar: AppBar(
        backgroundColor: const Color(0xFF151F24),
        title: Text(product['name'] ?? "Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // IMAGE
            product['image'] != null
                ? (product['image']!.startsWith('assets/')
                ? Image.asset(product['image']!, height: 200)
                : Image.network(product['image']!, height: 100))
                : Container(
              height: 100,
              color: Colors.grey[800],
              child: const Icon(Icons.image, size: 100, color: Colors.white54),
            ),
            const SizedBox(height: 20),

            // NAME
            Text(
              product['name'] ?? "Unnamed",
              style: const TextStyle(
                  color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
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
                  addToCart(product); // add to global cartList
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Added to cart"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
