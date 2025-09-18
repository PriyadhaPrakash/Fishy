import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://static.vecteezy.com/system/resources/previews/049/158/818/non_2x/grilled-meat-platter-with-assorted-cuts-and-garnishes-served-on-a-black-plate-cut-out-stock-png.png',
              width: 200,
              height: 200,
            ),
            Container(
              height: 30,
              width: 100,
              color: Colors.green.shade700,
              child: Center(
                child: Text("SIGN UP", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
