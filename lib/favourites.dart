import 'package:fishy/Cart.dart';
import 'package:flutter/material.dart';


class FavoPage extends StatefulWidget {
  final List<Map<String, String>> favoriteList;

  const FavoPage({super.key, required this.favoriteList});

  @override
  State<FavoPage> createState() => _FavoPageState();
}

class _FavoPageState extends State<FavoPage> {
  List<CartItem> cartList = []; // store items added to cart

  Widget _buildImage(Map<String, String> item, {double? height, double? width, BoxFit fit = BoxFit.cover}) {
    final img = item['image'] ?? '';
    if (img.isEmpty) return Container(height: height ?? 180, width: width ?? double.infinity, color: Colors.grey.shade800, child: const Icon(Icons.image, size: 80, color: Colors.white54));
    return img.startsWith('assets/') ? Image.asset(img, height: height, width: width, fit: fit) : Image.network(img, height: height, width: width, fit: fit);
  }

  Future<void> _showItemDetails(BuildContext context, Map<String, String> item) {
    return showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: const Color(0xFF1E2A32),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(8), child: _buildImage(item, height: 180, width: double.infinity)),
              const SizedBox(height: 12),
              Text(item['name'] ?? 'Unnamed', style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(item['price'] ?? '', style: const TextStyle(color: Colors.grey, fontSize: 16)),
              const SizedBox(height: 8),
              if ((item['desc'] ?? '').isNotEmpty) Text(item['desc']!, style: const TextStyle(color: Colors.white70)),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close', style: TextStyle(color: Colors.white70))),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      Navigator.pop(context);

                      // Add to cart
                      final existing = cartList.indexWhere((e) => e.name == item['name']);
                      if (existing != -1) {
                        cartList[existing].quantity++;
                      } else {
                        cartList.add(CartItem(name: item['name']!, price: item['price']!, image: item['image'] ?? ''));
                      }

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to cart')));
                      setState(() {}); // refresh state if needed
                    },
                    child: const Text('Add to Cart', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151F24),
      appBar: AppBar(
        backgroundColor: const Color(0xFF151F24),
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
        title: const Text("Favourites", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),

      ),
      body: widget.favoriteList.isEmpty
          ? const Center(child: Text("No favourites yet", style: TextStyle(color: Colors.white)))
          : ListView.builder(
        itemCount: widget.favoriteList.length,
        itemBuilder: (context, index) {
          final item = widget.favoriteList[index];
          return InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () => _showItemDetails(context, item),
            child: Card(
              color: const Color(0xFF1E2A32),
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: item["image"] != null && item["image"]!.isNotEmpty
                          ? (item["image"]!.startsWith('assets/')
                          ? Image.asset(item["image"]!, height: 60, width: 60, fit: BoxFit.cover)
                          : Image.network(item["image"]!, height: 60, width: 60, fit: BoxFit.cover))
                          : Container(height: 60, width: 60, color: Colors.grey[800], child: const Icon(Icons.image, color: Colors.white54)),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item["name"] ?? "Unnamed", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16)),
                          const SizedBox(height: 5),
                          Text(item["price"] ?? "", style: const TextStyle(color: Colors.grey, fontSize: 14)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.favorite, color: Colors.red),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}