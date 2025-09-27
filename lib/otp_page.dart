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
      backgroundColor: const Color(0xFF151F24),
      appBar: AppBar(
        backgroundColor: const  Color(0xFF151F24),
        leading: BackButton(color: Colors.white),
        title: Text(
          "Verification",
          style: TextStyle(color: const Color(0xFFFFFFFF), fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 55),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Enter Code",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "We sent a 4-digit code sent \n to your phone",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 40),
              OtpTextField(
                numberOfFields: 4,

                borderColor: Colors.cyan,
                showFieldAsBox: true,
                textStyle: const TextStyle(color: Colors.grey),
                onSubmit: (String verificationCode) {
                  print("Entered OTP: $verificationCode");

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("OTP Entered")));
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn't receive the otp ?",
                      style: TextStyle(color: Colors.grey,fontSize: 15),
                    ),TextButton(onPressed: (){}, child: const Text("resend",style: TextStyle(color: Colors.blueAccent),))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
