
import 'package:fishy/Homepage.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  // Pages for each tab
  final List<Widget> _pages = [
    const HomePage(),
    const Center(child: Text("")),
    const Center(child: Text("")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  "Delivery To...",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(onTap: (){},child: Icon(Icons.keyboard_arrow_down),)
              ],
            ),
            Text("Velupadam,kerala,63102,India",style: TextStyle(fontSize:12,color: Colors.black ),),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),

        ],
      ),
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.green.shade900,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Menu"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),

    );
  }
}
