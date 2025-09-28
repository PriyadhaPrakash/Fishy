
import 'package:fishy/Homepage.dart';
import 'package:fishy/favourites.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart,color: Colors.white,)),


        ],
      ),
      body:HomePage(
        favoriteList: favoriteList,
        onToggleFavorite: toggleFavorite,
      )





    );
  }
}