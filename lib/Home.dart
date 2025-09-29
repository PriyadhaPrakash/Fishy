
import 'package:fishy/Cart.dart';
import 'package:fishy/Homepage.dart';
import 'package:fishy/favourites.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  void toggleFavorite(Map<String, String> item) {
    setState(() {
      if (favoriteList.contains(item)) {
        favoriteList.remove(item);
      } else {
        favoriteList.add(item);
      }
    });
  }

  List<Map<String, String>> favoriteList = [];
  List<Widget> _screens() {
    return [
      HomePage(
        favoriteList: favoriteList,
        onToggleFavorite: toggleFavorite,
      ),
      Center(
        child: Text(
          "Store Page",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      Center(
        child: Text(
          "My Orders",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      Center(
        child: Text(
          "Profile Page",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151F24),
      appBar: AppBar(
        backgroundColor: const Color(0xFF151F24),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
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

          ],
        ),
        actions: [
          IconButton(onPressed: () { Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoPage(favoriteList: favoriteList),
            ),
          );}, icon: const Icon(Icons.favorite_border_sharp,color: Colors.white,)),
          IconButton(onPressed: () {Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(cartItems: [],),
            ),
          );}, icon: const Icon(Icons.shopping_cart,color: Colors.white,)),


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