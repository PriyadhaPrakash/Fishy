import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String price;
  final String image;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.image,
    this.quantity = 1, // default = 1
  });
}
List<CartItem> cartList = [];




class CartPage extends StatefulWidget {
  final List<CartItem> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void addToCart(Map<String, String> product) {
    final index = cartList.indexWhere((e) => e.name == product['name']);

    if (index != -1) {
      // If item already exists, increment quantity
      cartList[index].quantity++;
    } else {
      // Else add new item
      cartList.add(CartItem(
        name: product['name']!,
        price: product['price']!,
        image: product['image'] ?? '',
      ));
    }
  }
  double get subtotal {
    return widget.cartItems.fold(0, (sum, item) {
      return sum + (double.parse(item.price) * item.quantity);
    });
  }

  double delivery = 50;

  @override
  Widget build(BuildContext context) {
    double total = subtotal + delivery;

    return Scaffold(
      backgroundColor: const Color(0xFF151F24),
      appBar: AppBar(
        backgroundColor: const Color(0xFF151F24),
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
        title: const Text("CartPage", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final item = widget.cartItems[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Image.asset(item.image, width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(item.name),
                    subtitle: Text("₹${item.price} x ${item.quantity}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (item.quantity > 1) {
                                item.quantity--;
                              }
                            });
                          },
                        ),
                        Text("${item.quantity}"),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              item.quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),


          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF151F24),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const Text("Subtotal",style: TextStyle(color: Colors.white),),
                  Text("₹$subtotal",style: TextStyle(color: Colors.white),),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const Text("Delivery",style: TextStyle(color: Colors.white),),
                  Text("₹$delivery",style: TextStyle(color: Colors.white),),
                ]),
                const Divider(),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const Text("Total", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                  Text("₹$total", style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                ]),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to checkout page
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Proceeding to Checkout...")),
                    );
                  },
                  child: const Text("Proceed to Checkout",style: TextStyle(color: Colors.blue),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
