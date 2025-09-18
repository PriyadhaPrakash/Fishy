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
      appBar: AppBar(
        leading: BackButton(),
        title: Text("OTP Verification"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Verification",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 32),
            ),
            SizedBox(height: 20),
            Text(
              "Enter the 4-digit OTP sent to your phone",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            OtpTextField(
              numberOfFields: 4,
              borderColor: Colors.cyan,
              showFieldAsBox: true,
              onSubmit: (String verificationCode) {
                // This gets called when all 4 boxes are filled
                print("Entered OTP: $verificationCode");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("OTP Entered")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
