import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:loansettle/domain/model/creditscore/CreditScoreInformation.dart';

import '../../utils/FilesUtils.dart';
import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';

class IncreaseCibleScoreDetails extends StatefulWidget {
  double CurrentCridtScore;
  double achiveCreditScore;
  double time;

  IncreaseCibleScoreDetails(
      {super.key,
      required this.time,
      required this.achiveCreditScore,
      required this.CurrentCridtScore});

  @override
  State<IncreaseCibleScoreDetails> createState() =>
      _IncreaseCibleScoreDetailsState();
}

class _IncreaseCibleScoreDetailsState extends State<IncreaseCibleScoreDetails> {
  
     List<double> list = [];
  final random = Random();
@override
  void initState() {
    super.initState();
setState(() {
    spots();
});
  }

 List<double> spots() {
  int currentScore=  widget.CurrentCridtScore.toInt();
    list.clear();
    int total = 0;
    int randomNumber = 0;
    for (int i = 0; i < widget.time; i++) {
      randomNumber = random.nextInt(60);
      total = currentScore + randomNumber;
      list.add(total.toDouble());
      currentScore = currentScore + 70;
    }
    print(list);
    return list;
  }

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
              TextButton(
                  onPressed: () {
                    // spots();
                  },
                  child: Text("djbsfbjhds")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildScoreAndTimeCard(
                      title: "${widget.achiveCreditScore.toInt()}",
                      desc: CreditScoreData.scoreDesc),
                  const SizedBox(width: 16),
                  buildScoreAndTimeCard(
                      title: "${widget.time.toInt()}",
                      desc: CreditScoreData.timeDesc)
                ],
              ),
              makeSpaceVertically(),
              buildDescription(
                desc: CreditScoreData.generateDesc(
                    creditScore: CreditScoreData.howToAchive(
                        widget.CurrentCridtScore, widget.achiveCreditScore),
                    time: widget.time.toInt(),
                    achiveCreditScore: widget.achiveCreditScore.toInt()),
              ),
              makeSpaceVertically(),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: DynamicLineChart(
                  currentScore: widget.CurrentCridtScore,
                  wantedScore: widget.achiveCreditScore,
                  numberOfMonths: widget.time.toInt(),
                  // This will give spots for graph
                  yValues: list,
                  minYValue: widget.CurrentCridtScore.toInt(),
                  maxYValue: widget.achiveCreditScore.toInt(),
                ),
              ),
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
}

class DynamicLineChart extends StatelessWidget {
  final List<double> yValues;
  final int minYValue;
  final int maxYValue;
  final numberOfMonths;
  final wantedScore;
  final currentScore;

  DynamicLineChart(
      {required this.yValues,
      required this.minYValue,
      required this.maxYValue,
      required this.numberOfMonths,
      required this.wantedScore,
      required this.currentScore});

  @override
  Widget build(BuildContext context) {
    List<String> months = _generateNextMonths(numberOfMonths);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            borderData: FlBorderData(
              show: true,
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 1),
                left: BorderSide(color: Colors.grey, width: 1),
              ),
            ),
            // This is displaying grid between chart.
            gridData: FlGridData(show: true),
            // Data is displaying from this widget
            titlesData: FlTitlesData(
              //  Button side
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: (value, _) {
                    int index = value.toInt();
                    if (index >= 0 && index < months.length) {
                      return Text(
                        months[index],
                        style: TextStyle(fontSize: 12),
                      );
                    }
                    return Text('');
                  },
                ),
              ),

              // left side of data.
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 100.0,
                  getTitlesWidget: (value, _) {
                    return Text(
                      value.toInt().toString(),
                      style: TextStyle(fontSize: 12),
                    );
                  },
                ),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: _generateSpots(yValues),
                isCurved: true,
                barWidth: 3,
                color: Color(buttonColor),
                belowBarData: BarAreaData(show: false),
              ),
            ],
            minX: 0,
            maxX: (months.length - 1)
                .toDouble(), // This will  give  columns for month area
            minY: minYValue.toDouble(), // This will  give  numbers in x axis
            maxY: maxYValue.toDouble(),
          ),
        ),
      ),
    );
  }

  List<String> _generateNextMonths(int count) {
    DateTime now = DateTime.now();
    List<String> months = [];
    for (int i = 0; i < count; i++) {
      DateTime month = DateTime(now.year, now.month + i, 1);
      months.add(DateFormat.MMM().format(month));
    }
    return months;
  }

  List<FlSpot> _generateSpots(List<double> yValues) {
    List<FlSpot> spots = [];
    for (int i = 0; i < yValues.length; i++) {
      spots.add(FlSpot(i.toDouble(), yValues[i]));
    }
    return spots;
  }
}
