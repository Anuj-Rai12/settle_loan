import 'package:flutter/material.dart';
import 'package:loansettle/presentaion/ui/viewpager/walkThrough/Page.dart';
import 'package:loansettle/utils/FilesUtils.dart';

class AppGoToScreen extends StatefulWidget {
  const AppGoToScreen({super.key});

  @override
  State<AppGoToScreen> createState() => _AppGoToScreenState();
}

class _AppGoToScreenState extends State<AppGoToScreen> {
  final _list = [
    walkThroughPage(walkThroughScreenOneTittle, walkThroughScreenOne),
    walkThroughPage(walkThroughScreenTwoTittle, walkThroughScreenTwo),
    walkThroughPage(walkThroughScreenThreeTittle, walkThroughScreenThree)
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 0, right: 5, top: 16, bottom: 16),
                  child: TextButton(
                      onPressed: () {
                        // Go To Next Screen
                      },
                      child: const Text("Skip To Continue",
                          style: TextStyle(
                              fontSize: 16, fontFamily: publicSansReg))),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    debugLogs("current index $index");
                    return _list[index];
                  },
                  controller: _pageController,
                  itemCount: _list.length,
                  onPageChanged: (index) {},
                ),
              ),
            ],
          )),
    );
  }
}
