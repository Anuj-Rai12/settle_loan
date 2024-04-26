import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loansettle/utils/FilesUtils.dart';

import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';

class IncreaseCIBLScore extends StatefulWidget {
  const IncreaseCIBLScore({super.key});

  @override
  State<IncreaseCIBLScore> createState() => _IncreaseCIBLScoreState();
}

class _IncreaseCIBLScoreState extends State<IncreaseCIBLScore> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Color(textColor)),
          title: const Text("Credit builder",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(textColor),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: publicSansBold)),
          centerTitle: true),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 35, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("CiBl Score",
                    style: TextStyle(
                        color: Color(textColor),
                        fontFamily: publicSansReg,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: const Color(borderTint), width: 1)),
                  width: MediaQuery.of(context).size.width,
                  height: 56,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: publicSansReg,
                        fontSize: 16),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Your CiBl Score",
                        hintStyle: TextStyle(
                            color: Color(borderTint),
                            fontFamily: publicSansReg,
                            fontSize: 16)),
                    onChanged: (value) {
                      // get the value
                     // _email = value;
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Yours Target Score",
                    style: TextStyle(
                        color: Color(textColor),
                        fontFamily: publicSansReg,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: const Color(borderTint), width: 1)),
                  width: MediaQuery.of(context).size.width,
                  height: 56,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: publicSansReg,
                        fontSize: 16),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Your Target Score",
                        hintStyle: TextStyle(
                            color: Color(borderTint),
                            fontFamily: publicSansReg,
                            fontSize: 16)),
                    onChanged: (value) {
                      // get the value
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Timeframe (Months)",
                    style: TextStyle(
                        color: Color(textColor),
                        fontFamily: publicSansReg,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: const Color(borderTint), width: 1)),
                  width: MediaQuery.of(context).size.width,
                  height: 56,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    autofocus: true,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: publicSansReg,
                        fontSize: 16),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Add your Timeframe (Month)",
                        hintStyle: TextStyle(
                            color: Color(borderTint),
                            fontFamily: publicSansReg,
                            fontSize: 16)),
                    onChanged: (value) {
                      // get the value
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            margin:
            const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
            padding:
            const EdgeInsets.only(left: 8, right: 16, bottom: 12, top: 12),
            child: TextButton(
                onPressed: () {
                  debugLogs("text button clicked");
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    minimumSize: const Size(double.infinity, 55),
                    backgroundColor: const Color(buttonColor)),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: publicSansBold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                )),
          )
        ],
      ),
    ));
  }
}
