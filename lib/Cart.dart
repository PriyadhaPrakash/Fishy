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
    this.quantity = 1,
  });
}


List<CartItem> cartList = [];

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double deliveryCharge = 50.0;

  // Parse strings like "₹200" or "200" into double safely
  double _parsePrice(String p) {
    final cleaned = p.replaceAll(RegExp(r'[^\d.]'), '');
    if (cleaned.isEmpty) return 0.0;
    return double.tryParse(cleaned) ?? 0.0;
  }

  double get subtotal {
    double s = 0.0;
    for (final item in cartList) {
      s += _parsePrice(item.price) * item.quantity;
    }
    return s;
  }

  double get total {
    return subtotal + deliveryCharge;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151F24),
      appBar: AppBar(
        backgroundColor: const Color(0xFF151F24),


        title: const Text(
          "Cart",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: cartList.isEmpty
                ? const Center(child: Text("Your cart is empty", style: TextStyle(color: Colors.white)))
                : ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (context, index) {
                final item = cartList[index];

                Widget leading;
                if (item.image.startsWith('assets/')) {
                  leading = Image.asset(item.image, width: 50, height: 50, fit: BoxFit.cover);
                } else if (item.image.startsWith('http')) {
                  leading = Image.network(item.image, width: 50, height: 50, fit: BoxFit.cover);
                } else {
                  leading = Container(width: 50, height: 50, color: Colors.grey, child: const Icon(Icons.image));
                }

                return Card(
                  color: const  Color(0xFF151F24),
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: leading,
                    title: Text(item.name, style: const TextStyle(color: Colors.white)),
                    subtitle: Text(
                        "₹${_parsePrice(item.price).toStringAsFixed(2)} x ${item.quantity}",
                        style: const TextStyle(color: Colors.white)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove,color: Colors.white,),
                          onPressed: () {
                            setState(() {
                              if (item.quantity > 1) {
                                item.quantity--;
                              } else {
                                cartList.removeAt(index);
                              }
                            });
                          },
                        ),
                        Text("${item.quantity}", style: const TextStyle(fontSize: 16,color: Colors.white)),
                        IconButton(
                          icon: const Icon(Icons.add,color: Colors.white,),
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

          // Totals container
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF151F24),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const Text("Subtotal", style: TextStyle(color: Colors.white)),
                  Text("₹${subtotal.toStringAsFixed(2)}", style: const TextStyle(color: Colors.white)),
                ]),
                const SizedBox(height: 6),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const Text("Delivery Charge", style: TextStyle(color: Colors.white)),
                  Text("₹${deliveryCharge.toStringAsFixed(2)}", style: const TextStyle(color: Colors.white)),
                ]),
                const Divider(color: Colors.white30),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const Text("Total", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  Text("₹${total.toStringAsFixed(2)}", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ]),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    if (cartList.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cart is empty')));
                      return;
                    }
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Proceeding to Checkout...")));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text("Proceed to Checkout", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
