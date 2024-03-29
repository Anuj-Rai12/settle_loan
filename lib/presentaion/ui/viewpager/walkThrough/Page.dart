import 'package:flutter/material.dart';
import 'package:loansettle/utils/FilesUtils.dart';

Widget walkThroughPage(String title,String img) {
  return Container(
    child: Column(children: <Widget>[
        Image.asset(img),
        Text(title,
      style: const TextStyle(
          fontSize: 28,
          fontFamily: publicSansExtraBold,
          color: Colors.black))
      ]),
  );
}
