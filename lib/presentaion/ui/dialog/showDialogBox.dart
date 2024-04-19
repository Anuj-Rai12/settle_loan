import 'package:flutter/material.dart';
import 'package:loansettle/values/color/Colors.dart';
import 'package:loansettle/values/fonts/Fonts.dart';

void showDialogBox(BuildContext context, String title,
    String desc, bool okBtn) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          backgroundColor: const Color(editTextBg),
          title: Text(title,
              style: const TextStyle(
                  fontFamily: publicSansBold,
                  fontSize: 18,
                  color: Color(textColor))),
          content: Text(desc,
              style: const TextStyle(
                  fontFamily: publicSansBold,
                  fontSize: 16,
                  color: Color(editTextColor))),
          actions: (okBtn) ? ([
                  TextButton(
                    child: const Text('ok',
                        style: TextStyle(
                            fontFamily: publicSansReg,
                            color: Color(editTextColor))),
                    onPressed: () {
                      Navigator.of(context).pop(); // Dismiss the dialog
                      // Add your logout logic here
                    },
                  )
                ]) : [
                  TextButton(
                    child: const Text('Yes',
                        style: TextStyle(
                            fontFamily: publicSansReg,
                            color: Color(editTextColor))),
                    onPressed: () {
                      Navigator.of(context).pop(); // Dismiss the dialog
                      // Add your logout logic here
                    },
                  ),
                  TextButton(
                    child: const Text('No',
                        style: TextStyle(
                            fontFamily: publicSansReg,
                            color: Color(editTextColor))),
                    onPressed: () {
                      Navigator.of(context).pop(); // Dismiss the dialog
                    },
                  )
                ]);
    },
  );
}
