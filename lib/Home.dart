// lib/Home.dart
import 'package:fishy/Cart.dart';
import 'package:fishy/Homepage.dart';
import 'package:fishy/favourites.dart';
import 'package:flutter/material.dart';
import 'package:fishy/profile_display_page.dart';

class Home extends StatefulWidget {
  final String? name;
  final String? address;
  final String? landmark;
  final String? location;

  const Home({
    super.key,
    this.name,
    this.address,
    this.landmark,
    this.location,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  List<Map<String, String>> favoriteList = [];

  void toggleFavorite(Map<String, String> item) {
    setState(() {
      if (favoriteList.contains(item)) {
        favoriteList.remove(item);
      } else {
        favoriteList.add(item);
      }
    });
  }

  List<Widget> _screens() {
    return [
      HomePage(
        favoriteList: favoriteList,
        onToggleFavorite: toggleFavorite,
      ),
      const Center(
        child: Text(
          "Store Page",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      const Center(
        child: Text(
          "My Orders",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      ProfileDisplayPage(
        name: widget.name ?? '',
        address: widget.address ?? '',
        landmark: widget.landmark ?? '',
        location: widget.location ?? '',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151F24),

      appBar: AppBar(
        backgroundColor: const Color(0xFF151F24),
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "FreshCatch",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Pass favoriteList into FavoPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoPage(favoriteList: favoriteList),
                ),
              );
            },
            icon: const Icon(Icons.favorite_border_sharp, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              // CartPage uses the global cartList, so just push it
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
      ),
      body: _screens()[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF151F24),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: "Store",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "My Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
