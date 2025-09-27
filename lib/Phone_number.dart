import 'package:fishy/otp_page.dart';
import 'package:flutter/material.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151F24),
      appBar: AppBar(
        backgroundColor: const Color(0xFF151F24),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [SizedBox(height: 90,),
          Text('WELCOME BACK',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 5),
            child: Text(
              "Enter Your Phone Number to sign in",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white70,),
            ),
          ),
          SizedBox(height: 30.0),
          Center(
            child: SizedBox(
              width: 320,
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "phone-number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),   const SizedBox(height: 30),
          SizedBox(
            width: 320,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF18A2FE),
                minimumSize: Size(double.infinity, 48),// button color
                foregroundColor: Colors.white, // text/icon color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  //borderRadius: BorderRadius.zero, //Rectangular border
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 50),
                    pageBuilder: (context, animation, secondaryAnimation) => const OtpPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );

              },
              child: const Text('Continue'),

            ),
          ),
        ],
      ),
    );
  }
}
