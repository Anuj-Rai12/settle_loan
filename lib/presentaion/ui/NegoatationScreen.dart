
import 'package:flutter/material.dart';

class NegotiationScreen extends StatefulWidget {
  const NegotiationScreen({super.key});

  @override
  State<NegotiationScreen> createState() => _NegotiationScreenState();
}

class _NegotiationScreenState extends State<NegotiationScreen> {
  @override
  Widget build(BuildContext context) {
    return  const SafeArea(child: Scaffold(
      body: Center(
        child: Text("Working on Negotiation"),
      ),
    ));
  }
}
