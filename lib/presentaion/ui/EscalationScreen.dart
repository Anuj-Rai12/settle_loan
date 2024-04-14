

import 'package:flutter/material.dart';

class EscalationScreen extends StatefulWidget {
  const EscalationScreen({super.key});

  @override
  State<EscalationScreen> createState() => _EscalationScreenState();
}

class _EscalationScreenState extends State<EscalationScreen> {
  @override
  Widget build(BuildContext context) {
    return  const SafeArea(child: Scaffold(
      body: Center(
        child: Text("Working on EscalationScreen"),
      ),
    ));
  }
}
