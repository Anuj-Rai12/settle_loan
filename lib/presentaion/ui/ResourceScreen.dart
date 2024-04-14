

import 'package:flutter/material.dart';

class ResourceScreen extends StatefulWidget {
  const ResourceScreen({super.key});

  @override
  State<ResourceScreen> createState() => _ResourceState();
}

class _ResourceState extends State<ResourceScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: Center(
        child: Text("Working on Resource"),
      ),
    ));
  }
}
