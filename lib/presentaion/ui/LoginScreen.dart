import 'package:flutter/material.dart';
import '../../utils/FilesUtils.dart';
import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 8),
              child: const Text("Log In",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(textColor),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: publicSansBold))),
          Container(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 20, bottom: 8),
              child: const Text("Welcome back",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(textColor),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: publicSansBold))),
          //Email Address
          Container(
            margin:
                const EdgeInsets.only(left: 16, right: 16, top: 35, bottom: 12),
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
                  hintText: "Email Address",
                  hintStyle: TextStyle(
                      color: Color(editTextColor),
                      fontFamily: publicSansReg,
                      fontSize: 16)),
              onChanged: (value) {
                // get the value
              },
            ),
          ),
          //Password
          Container(
            margin:
                const EdgeInsets.only(left: 16, right: 16, top: 15, bottom: 12),
            padding: const EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(editTextBg)),
            width: MediaQuery.of(context).size.width,
            height: 56,
            child: TextFormField(
              obscureText: true,
              style: const TextStyle(
                  color: Color(editTextColor),
                  fontFamily: publicSansReg,
                  fontSize: 16),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Password",
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
          GestureDetector(
              onTap: () {
                debugLogs("print Clicked");
              },
              child: Container(
                  alignment: AlignmentDirectional.centerStart,
                  margin: const EdgeInsets.only(
                      top: 4, left: 16, right: 16, bottom: 12),
                  child: const Text("Forget Password?",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: publicSansReg,
                          color: Color(editTextColor))))),
          //Updated Log In
          Container(
            margin:
                const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
            child: TextButton(
                onPressed: () {
                  debugLogs("text button clicked");
                  context.goToNextScreenPopUp("/goTOScreen");
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    minimumSize: const Size(double.infinity, 55),
                    backgroundColor: const Color(buttonColor)),
                child: const Text(
                  "Log In",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: publicSansBold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                )),
          ),
          //New User Information
          Container(
            margin:
                const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
            child: TextButton(
                onPressed: () {
                  debugLogs("text button clicked");
                  //Navigator.pushNamed(context, '/HomeScreen');
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    minimumSize: const Size(double.infinity, 55),
                    backgroundColor: Colors.white),
                child: const Text(
                  "New User Sign Up",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: publicSansBold,
                      color: Color(textColor)),
                  textAlign: TextAlign.center,
                )),
          )
        ],
      ),
    ));
  }
}
