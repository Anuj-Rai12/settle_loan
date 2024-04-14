import 'package:flutter/material.dart';
import 'package:loansettle/values/color/Colors.dart';
import 'package:loansettle/values/fonts/Fonts.dart';

Widget walkThroughPage(String title, String desc, String img) {
  return Column(children: <Widget>[
    Image.asset(img),
    Container(
      padding:
          const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 12),
      child: Text(title,
          style: const TextStyle(
              fontSize: 28,
              fontFamily: publicSansExtraBold,
              color: Color(textColor))),
    ),
    Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 12),
      child: Text(desc,
          style: const TextStyle(
              fontSize: 16,
              fontFamily: publicSansReg,
              color: Color(textColor))),
    )
  ]);
}
