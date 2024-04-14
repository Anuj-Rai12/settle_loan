import 'package:flutter/material.dart';
import 'package:loansettle/values/fonts/Fonts.dart';
import '../../utils/FilesUtils.dart';
import '../../values/color/Colors.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Color(textColor)),
          title: const Text("Forget Password?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(textColor),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: publicSansBold)),
          centerTitle: true),
      body: Column(
        children: [
          //Email Address
          Container(
            margin:
                const EdgeInsets.only(left: 16, right: 16, top: 55, bottom: 12),
            padding: const EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(editTextBg)),
            width: MediaQuery.of(context).size.width,
            height: 56,
            child: TextFormField(
              autofocus: true,
              style: const TextStyle(
                  color: Color(editTextColor),
                  fontFamily: publicSansReg,
                  fontSize: 16),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter your Registered Email Address",
                  hintStyle: TextStyle(
                      color: Color(editTextColor),
                      fontFamily: publicSansReg,
                      fontSize: 16)),
              onChanged: (value) {
                // get the value
              },
            ),
          ),
          //Forget Password
          Container(
            margin:
                const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
            child: TextButton(
                onPressed: () {
                  debugLogs("text Submit Clicked");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: const Text(
                          "Password is Sent to your Register Email Address"),
                      action: SnackBarAction(
                        label: 'Got it',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    minimumSize: const Size(double.infinity, 55),
                    backgroundColor: const Color(buttonColor)),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: publicSansBold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                )),
          )
          //New User Information
        ],
      ),
    ));
  }
}
