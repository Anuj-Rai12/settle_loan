import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loansettle/utils/FilesUtils.dart';

class MainSplashScreen extends StatelessWidget {
  const MainSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Container(
                  child: Image.asset(splashScreen, fit: BoxFit.cover))),
        ],
      ),
    );
  }
}
