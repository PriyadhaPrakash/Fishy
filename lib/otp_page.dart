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
        title: Text("Verification",style: TextStyle(color: const Color(0xFFFFFFFF),fontSize: 18 ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Enter Code",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28,color: Color(0xFFFFFFFF) ),
              ),
              SizedBox(height: 20),
              Text(
                "We sent a 4-digit code sent \n to your phone",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16,color:Colors.grey ),
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
      ),
    );
  }
}
