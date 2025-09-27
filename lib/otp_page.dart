import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        leading: BackButton(),
        title: Text("OTP Verification",style: TextStyle(color: const Color(0xFFFFFFFF) ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Verification",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 32,color: Color(0xFFFFFFFF) ),
            ),
            SizedBox(height: 20),
            Text(
              "Enter the 4-digit OTP sent to your phone",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16,color: Color(0xFFFFFFFF) ),
            ),
            SizedBox(height: 40),
            OtpTextField(
              numberOfFields: 4,
              borderColor: Colors.cyan,
              showFieldAsBox: true,
              onSubmit: (String verificationCode) {
                print("Entered OTP: $verificationCode");
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("OTP Entered")));
              },
            ),
          ],
        ),
      ),
    );
  }
}
