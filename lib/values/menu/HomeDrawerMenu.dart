import 'package:flutter/material.dart';

import '../color/Colors.dart';
import '../fonts/Fonts.dart';

Drawer homeNavigationDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Color(buttonColor)),
          child: Text("Hi\nWelecome",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: publicSansBold)),
        ),
        ListTile(
          title: const Text("Item 1"),
          leading: const Icon(Icons.access_alarm),
          focusColor: const Color(editTextBg),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Item 2"),
          leading: const Icon(Icons.access_alarm),
          focusColor: const Color(editTextBg),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Item 2"),
          leading: const Icon(Icons.accessible_forward_rounded),
          focusColor: const Color(editTextBg),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Item 3"),
          leading: const Icon(Icons.accessibility),
          focusColor: const Color(editTextBg),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
