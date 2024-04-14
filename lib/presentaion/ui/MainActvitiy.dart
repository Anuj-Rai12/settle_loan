import 'package:flutter/material.dart';
import 'package:loansettle/presentaion/ui/EscalationScreen.dart';
import 'package:loansettle/presentaion/ui/MylawyerScreen.dart';
import 'package:loansettle/presentaion/ui/NegoatationScreen.dart';
import 'package:loansettle/presentaion/ui/ResourceScreen.dart';
import 'package:loansettle/utils/FilesUtils.dart';
import 'package:loansettle/values/color/Colors.dart';
import 'package:loansettle/values/fonts/Fonts.dart';
import 'HomeScreen.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({super.key});

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  final _pages = [
    const HomeScreen(),
    const NegotiationScreen(),
    const EscalationScreen(),
    const ResourceScreen()
  ];

  var _pageIndex = 0;

  void _tapIndex(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: _pages[_pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goToNextScreen("/myLawyerScreen");
        },
        elevation: 0,
        child: const Icon(Icons.person_2_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 75,
      color: Colors.white,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                elevation: MaterialStateProperty.all(0)),
            onPressed: () {
              _tapIndex(0);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _pageIndex == 0
                    ? const Icon(
                        Icons.home_rounded,
                        color: Color(textColor),
                      )
                    : const Icon(
                        Icons.home_filled,
                        color: Color(editTextColor),
                      ),
                Text("Home",
                    style: TextStyle(
                        fontFamily: publicSansReg,
                        fontSize: 11,
                        color: _pageIndex != 0
                            ? const Color(editTextColor)
                            : const Color(textColor)))
              ],
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                elevation: MaterialStateProperty.all(0)),
            onPressed: () {
              _tapIndex(1);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _pageIndex == 1
                    ? const Icon(
                        Icons.handshake_rounded,
                        color: Color(textColor),
                      )
                    : const Icon(
                        Icons.handshake_outlined,
                        color: Color(editTextColor),
                      ),
                Text("Negotiation\n\t\t\tStatus",
                    style: TextStyle(
                        fontFamily: publicSansReg,
                        fontSize: 11,
                        color: _pageIndex != 1
                            ? const Color(editTextColor)
                            : const Color(textColor)))
              ],
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                elevation: MaterialStateProperty.all(0)),
            onPressed: () {
              _tapIndex(2);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _pageIndex == 2
                    ? const Icon(
                        Icons.auto_graph_rounded,
                        color: Color(textColor),
                      )
                    : const Icon(
                        Icons.auto_graph_outlined,
                        color: Color(editTextColor),
                      ),
                Text("Escalation",
                    style: TextStyle(
                        fontFamily: publicSansReg,
                        fontSize: 11,
                        color: _pageIndex != 2
                            ? const Color(editTextColor)
                            : const Color(textColor)))
              ],
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                elevation: MaterialStateProperty.all(0)),
            onPressed: () {
              _tapIndex(3);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _pageIndex == 3
                    ? const Icon(
                        Icons.help_outlined,
                        color: Color(textColor),
                      )
                    : const Icon(
                        Icons.help_outline_outlined,
                        color: Color(editTextColor),
                      ),
                Text("Resources",
                    style: TextStyle(
                        fontFamily: publicSansReg,
                        fontSize: 11,
                        color: _pageIndex != 3
                            ? const Color(editTextColor)
                            : const Color(textColor)))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
