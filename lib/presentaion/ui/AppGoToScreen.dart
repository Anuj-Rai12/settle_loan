import 'package:flutter/material.dart';
import 'package:loansettle/presentaion/ui/viewpager/walkThrough/Page.dart';
import 'package:loansettle/utils/FilesUtils.dart';
import 'package:loansettle/values/string/Strings.dart';
import 'package:loansettle/values/res/Resources.dart';
import 'package:loansettle/values/fonts/Fonts.dart';
import '../../values/color/Colors.dart';



class AppGoToScreen extends StatefulWidget {
  const AppGoToScreen({super.key});

  @override
  State<AppGoToScreen> createState() => _AppGoToScreenState();
}

class _AppGoToScreenState extends State<AppGoToScreen> {
  final _list = [
    walkThroughPage(walkThroughScreenThreeTittle,walkThroughScreenThreeDesc, walkThroughScreenThree),
    walkThroughPage(walkThroughScreenOneTittle,walkThroughScreenOneDesc, walkThroughScreenOne),
    walkThroughPage(walkThroughScreenTwoTittle,walkThroughScreenTwoDesc, walkThroughScreenTwo)
  ];

  final PageController _pageController = PageController();

  final ValueNotifier<int> _pageNotifier = ValueNotifier<int>(0);

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
              SizedBox(
                height: 550,
                child: Expanded(
                  child: PageView.builder(
                    itemBuilder: (context, index) {
                      debugLogs("current index $index");
                      return _list[index];
                    },
                    controller: _pageController,
                    itemCount: _list.length,
                    onPageChanged: (index) {
                      _pageNotifier.value = index;
                    },
                  ),
                ),
              ),
              Positioned(
                top: 16,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_list.length, _buildDot),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 12),
                child: TextButton(
                    onPressed: () {
                      debugLogs("text button clicked");
                    },
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        minimumSize: Size(double.infinity, 55),
                        backgroundColor: const Color(buttonColor)),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: publicSansBold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
              )
            ],
          )),
    );
  }

  Widget _buildDot(int index) {
    return ValueListenableBuilder<int>(
      valueListenable: _pageNotifier,
      builder: (context, value, child) {
        return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: value == index ? Colors.blue : Colors.grey,
          ),
        );
      },
    );
  }
}
