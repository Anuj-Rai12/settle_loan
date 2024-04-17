

import 'package:flutter/material.dart';
import 'package:loansettle/values/color/Colors.dart';
import 'package:loansettle/values/fonts/Fonts.dart';

void showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(editTextBg),
        title: const Text('Logout',style:TextStyle(
            fontFamily: publicSansBold,
            fontSize: 18,
            color: Color(textColor)
        )),
        content: const Text('Are you sure you want to logout?',
        style: TextStyle(
          fontFamily: publicSansBold,
          fontSize: 16,
          color: Color(editTextColor)
        )),
        actions: <Widget>[
          TextButton(
            child: const Text('Yes',style: TextStyle(
                fontFamily: publicSansReg,
                color: Color(editTextColor)
            )),
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog
              // Add your logout logic here
            },
          ),
          TextButton(
            child: const Text('No',style: TextStyle(
                fontFamily: publicSansReg,
                color: Color(editTextColor)
            )),
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog
            },
          )
        ],
      );
    },
  );
}
