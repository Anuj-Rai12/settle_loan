import 'package:flutter/material.dart';

import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';

class EscalationScreen extends StatefulWidget {
  const EscalationScreen({super.key});

  @override
  State<EscalationScreen> createState() => _EscalationScreenState();
}

class _EscalationScreenState extends State<EscalationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Color(textColor)),
          title: const Text("Escalation",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(textColor),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: publicSansBold)),
          centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16,left: 16,right: 16,bottom: 16),
            margin: const EdgeInsets.only(top: 45),
            child: const Text(
              "You can escalate your concern on the below written email id if you have any issue with the lawyer or Financial advisor and our team will be get back to you within 24 hours.",
              style: TextStyle(
                  fontFamily: publicSansReg,
                  fontSize: 22,
                  color: Color(textColor),
                  ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 16,left: 16,right: 16,bottom: 16),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Email Address",
                      style: TextStyle(
                        color: Color(textColor),
                        fontFamily: publicSansBold,
                        fontSize: 22,
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: const Text("xyz@gmail.com",
                        style: TextStyle(
                          color: Color(editTextColor),
                          fontFamily: publicSansReg,
                          fontSize: 16,
                        )),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: const Text("xyz1@gmail.com",
                        style: TextStyle(
                          color: Color(editTextColor),
                          fontFamily: publicSansReg,
                          fontSize: 16,
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
