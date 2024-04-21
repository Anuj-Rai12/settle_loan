import 'package:flutter/material.dart';
import 'package:loansettle/domain/model/GoalsAndTraget.dart';
import 'package:loansettle/utils/FilesUtils.dart';
import 'package:loansettle/values/color/Colors.dart';
import 'package:loansettle/values/fonts/Fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget listOfGoalsAndTargetAdaptor(
    List<GoalsAndTarget> arr, BuildContext context) {
  return Column(
    children: [
      ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: arr.length,
          itemBuilder: (context, position) {
            var data = arr[position];
            return InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularPercentIndicator(
                        radius: 35.0,
                        lineWidth: 4.0,
                        percent: data.progress/100,
                        backgroundColor: Colors.grey,
                        center: Text(
                          "${data.progress}%",
                          style: const TextStyle(
                              color: Color(textColor),
                              fontFamily: publicSansReg,
                              fontSize: 16),
                        ),
                        progressColor: const Color(buttonColor),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                data.loanType,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: publicSansReg,
                                    color: Color(textColor)),
                              ),
                              Text(
                                "$Rupess_Symbol${data.monthlyEmi}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: publicSansBold,
                                    color: Color(textColor)),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("Due Date",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: publicSansReg,
                                    color: Color(textColor))),
                            Text(
                              data.dueDate,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: publicSansBold,
                                  color: Color(textColor)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ));
          }),
    ],
  );
}
