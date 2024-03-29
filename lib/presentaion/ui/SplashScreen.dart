import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:loansettle/utils/FilesUtils.dart';

class MainSplashScreen extends StatefulWidget {
  const MainSplashScreen({super.key});

  @override
  State<MainSplashScreen> createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((time) {
      Future.delayed(const Duration(seconds: 2), () {
        //showButton();
        Navigator.pushNamedAndRemoveUntil(context, "/goTOScreen",(route)=> false);
      //  Navigator.pop(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(splashScreen),
              ),
            )
          ],
        ),
      ),
    );
  }
}
