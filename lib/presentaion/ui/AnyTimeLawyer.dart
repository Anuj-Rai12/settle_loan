import 'package:flutter/material.dart';
import 'package:loansettle/values/res/Resources.dart';
import '../../domain/model/AnyTimeLaywerModel.dart';
import '../../utils/FilesUtils.dart';
import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';
import 'adaptor/AnyTimeAdaptor.dart';

class AnyTimeLawyer extends StatefulWidget {
  const AnyTimeLawyer({super.key});

  @override
  State<AnyTimeLawyer> createState() => _AnyTimeLawyerState();
}

class _AnyTimeLawyerState extends State<AnyTimeLawyer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  anytimeLawyerIMG,
                  width: MediaQuery.of(context).size.width,
                  height: 320,
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16,right: 16,top: 12,bottom: 12),
                  child: const Text("Anytime Lawyer",
                      style: TextStyle(
                        color: Color(textColor),
                        fontFamily: publicSansBold,
                        fontSize: 28,
                      )),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: const Text(
                      "Get access to legal assistance for you and your family. Our team of lawyers can help with a wide  range of issues.",
                      style: TextStyle(
                        color: Color(editTextColor),
                        fontFamily: publicSansReg,
                        fontSize: 14,
                      )
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
                  child: const Text("What's Included",
                      style: TextStyle(
                        color: Color(textColor),
                        fontFamily: publicSansBold,
                        fontSize: 18,
                      )),
                ),
                anyTimeAdaptor(AnyTimeLawyerModel.ls,context)
              ],
            ),
            Container(
              margin:
                  const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
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
                    "Try Now!!",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: publicSansBold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
