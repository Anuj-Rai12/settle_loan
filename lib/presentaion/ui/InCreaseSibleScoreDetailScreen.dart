import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loansettle/domain/model/creditscore/CreditScoreInformation.dart';

import '../../utils/FilesUtils.dart';
import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';

class IncreaseCibleScoreDetails extends StatefulWidget {
  const IncreaseCibleScoreDetails({super.key});

  @override
  State<IncreaseCibleScoreDetails> createState() =>
      _IncreaseCibleScoreDetailsState();
}

class _IncreaseCibleScoreDetailsState extends State<IncreaseCibleScoreDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Color(textColor)),
          title: const Text("Improve your Credit Score",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(textColor),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: publicSansBold)),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildScoreAndTimeCard(
                      title: "760", desc: CreditScoreData.scoreDesc),
                  const SizedBox(width: 16),
                  buildScoreAndTimeCard(
                      title: "3", desc: CreditScoreData.timeDesc)
                ],
              ),
              makeSpaceVertically(),
              buildDescription(
                  desc: CreditScoreData.generateDesc(creditScore: 20, time: 3)),
              makeSpaceVertically(),
              const Text("Try This",
                  style: TextStyle(
                      fontFamily: publicSansBold,
                      fontSize: 20,
                      color: Colors.black),
                  textAlign: TextAlign.start),
              makeSpaceVertically(),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount:
                      CreditScoreData.generateCreditScoreDataDesc().length,
                  itemBuilder: (context, position) {
                    return buildTheStepsToAnswerTheQuestion(
                        desc: CreditScoreData.generateCreditScoreDataDesc()[
                                position]
                            .desc);
                  }),
              makeSpaceVertically(height: 40),
              Container(
                margin: const EdgeInsets.only(
                    left: 16, right: 16, top: 12, bottom: 12),
                child: TextButton(
                    onPressed: () {
                      debugLogs("text button clicked");
                      context.onBackPress();
                    },
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        minimumSize: const Size(double.infinity, 55),
                        backgroundColor: const Color(buttonColor)),
                    child: const Text(
                      "Check your Credit Score Again",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: publicSansBold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
              ),
              makeSpaceVertically(height: 48)
            ],
          ),
        ),
      ),
    );
  }
}

Widget makeSpaceVertically({double height = 16}) {
  return SizedBox(height: height);
}

Widget buildDescription({required String desc}) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
        color: const Color(indicatorTintColor),
        borderRadius: BorderRadius.circular(8)),
    child: Text(
      desc,
      style: const TextStyle(
          fontFamily: publicSansReg, fontSize: 16, color: Colors.black),
      textAlign: TextAlign.center,
    ),
  );
}

Widget buildTheStepsToAnswerTheQuestion({required String desc}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
        color: const Color(indicatorTintColor),
        borderRadius: BorderRadius.circular(8)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.thumb_up_alt_outlined,
          color: Colors.blue,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            desc,
            style: const TextStyle(
                fontFamily: publicSansReg, fontSize: 16, color: Colors.black),
            textAlign: TextAlign.start,
          ),
        )
      ],
    ),
  );
}

Widget buildScoreAndTimeCard({required String title, required String desc}) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: const Color(indicatorTintColor),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,
              style: const TextStyle(
                  fontFamily: publicSansBold,
                  fontSize: 20,
                  color: Colors.black)),
          const SizedBox(height: 4),
          Text(
            desc,
            style: const TextStyle(
                fontFamily: publicSansReg, fontSize: 16, color: Colors.black),
            textAlign: TextAlign.start,
          )
        ],
      ),
    ),
  );
}
