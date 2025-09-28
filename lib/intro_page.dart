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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Food image
            Image.network(
              'https://static.vecteezy.com/system/resources/previews/049/158/818/non_2x/grilled-meat-platter-with-assorted-cuts-and-garnishes-served-on-a-black-plate-cut-out-stock-png.png',
              width: 220,
              height: 220,
            ),
            const SizedBox(height: 25),

            // Welcome text
            const Text(
              "Welcome to Fresh Catch",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1.3,
              ),
            ),
            const SizedBox(height: 40),

            // Animated Sign Up Button
            SizedBox(
              width: 180,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // handle signup
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  elevation: 6,
                  shadowColor: Colors.green.withOpacity(0.3),
                ),
                child: const Text(
                  "SIGN UP",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
