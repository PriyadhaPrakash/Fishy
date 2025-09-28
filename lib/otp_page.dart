import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String _enteredOtp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF151F24),
      appBar: AppBar(
        backgroundColor: const Color(0xFF151F24),
        leading: const BackButton(color: Colors.white),
        title: const Text(
          "Verification",
          style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Enter Code",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "We sent a 4-digit code to your phone",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 40),

              OtpTextField(
                numberOfFields: 4,
                borderColor: Colors.cyan,
                showFieldAsBox: true,
                textStyle: const TextStyle(color: Colors.grey),
                onCodeChanged: (String code) {
                  _enteredOtp = code;
                },
                onSubmit: (String verificationCode) {
                  setState(() {
                    _enteredOtp = verificationCode;
                  });
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    if (_enteredOtp.trim().length == 4) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Verifying OTP")),
                      );

                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please enter a valid 4-digit OTP")),
                      );
                    }
                  },
                  child: const Text(
                    "Verify",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't receive the otp ?",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Resend OTP tapped")),
                      );
                    },
                    child: const Text(
                      "Resend",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        ),
      ),
    );
  }
}
