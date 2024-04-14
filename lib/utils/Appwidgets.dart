
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildDot(int index, ValueNotifier<int> _pageNotifier) {
  return ValueListenableBuilder<int>(
    valueListenable: _pageNotifier,
    builder: (context, value, child) {
      return Container(
        width: 8.0,
        height: 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: value == index ? Colors.blue : Colors.grey,
        ),
      );
    },
  );
}*/


import 'package:flutter/material.dart';
import 'package:loansettle/values/color/Colors.dart';


class DiamondPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(buttonColor);
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, size.height / 2);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
