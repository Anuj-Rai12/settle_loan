import 'package:flutter/material.dart';

import '../../domain/model/ComplaintAgainstData.dart';
import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';
import 'adaptor/ComplaintHelpAgainstData.dart';

class ComplaintAgainstRecoveryAgent extends StatefulWidget {
  const ComplaintAgainstRecoveryAgent({super.key});

  @override
  State<ComplaintAgainstRecoveryAgent> createState() =>
      _ComplaintAgainstRecoveryAgentState();
}

class _ComplaintAgainstRecoveryAgentState
    extends State<ComplaintAgainstRecoveryAgent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Color(textColor)),
          title: const Text("Complaint Against Recovery Agent",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(textColor),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: publicSansBold)),
          centerTitle: true),
      body: SingleChildScrollView(
          child: Column(
            children: [
              complaintHelpAgainstData(ComplainAgainstData.list, context),
              const SizedBox(height: 60)
            ],
          )),
    ));
  }
}
