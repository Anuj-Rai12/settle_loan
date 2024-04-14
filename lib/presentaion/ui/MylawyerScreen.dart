

import 'package:flutter/material.dart';

class MyLawyerScreen extends StatefulWidget {
  const MyLawyerScreen({super.key});

  @override
  State<MyLawyerScreen> createState() => _MyLawyerScreenState();
}

class _MyLawyerScreenState extends State<MyLawyerScreen> {
  @override
  Widget build(BuildContext context) {
    return  const SafeArea(child: Scaffold(
      body: Center(
        child: Text("Working on Layer Section"),
      ),
    ));
  }
}
