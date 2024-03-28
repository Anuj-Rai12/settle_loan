

import 'package:flutter/material.dart';

class AppGoToScreen extends StatefulWidget {
  const AppGoToScreen({super.key});

  @override
  State<AppGoToScreen> createState() => _AppGoToScreenState();
}

class _AppGoToScreenState extends State<AppGoToScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Heloo ji"),
      ),
    );
  }
}
