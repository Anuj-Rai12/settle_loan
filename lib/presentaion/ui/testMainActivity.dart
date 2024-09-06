import 'package:flutter/material.dart';
import 'package:loansettle/domain/model/GoalsAndTraget.dart';
import 'package:loansettle/domain/model/home/HomeScreenResponse.dart';
import 'package:loansettle/presentaion/ui/EscalationScreen.dart';
import 'package:loansettle/presentaion/ui/HelpAndResourcesScreen.dart';
import 'package:loansettle/presentaion/ui/HomeScreen.dart';
import 'package:loansettle/presentaion/ui/NegoatationScreen.dart';
import 'package:loansettle/utils/FilesUtils.dart';
import 'package:loansettle/values/color/Colors.dart';
import 'package:loansettle/values/fonts/Fonts.dart';
import 'package:loansettle/values/menu/HomeDrawerMenu.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({super.key});

  @override
  State<MainActivity> createState() => Test_MainActivityState();
}

class Test_MainActivityState extends State<MainActivity> {
  int currentPageIndex = 0;
  List<String> titleOfNavigationScreens = [
    "Home",
    "Nagotiation Status",
    "Escalation",
    "Resources"
  ];

  final HomeScreenResponse data = HomeScreenResponse(); 



  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      drawer: HomedrawerMenu(),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goToNextScreen("/anyTimeLawyer");
        },
        elevation: 0,
        child: const Icon(Icons.person_2_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text(titleOfNavigationScreens[currentPageIndex],
            style: const TextStyle(
                fontFamily: publicSansReg,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(textColor))),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              context.showSnackBar("No Notification yet");
            },
          )
        ],
      ),
      body: SafeArea(
        child: <Widget>[
          const HomeScreen(),
           NegotiationScreen(isNavigateFromNavigationBar: true,),
           EscalationScreen(isNavigateFromNavigationBar: true,),
           HelpAndResourcesScreen(isNavigateFromNavigationBar: true,)
        ][currentPageIndex],
      ),
      bottomNavigationBar: myNavigationBarr(),
    );
  }

  NavigationBar myNavigationBarr() {
    return NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: Colors.white,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
            ),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.handshake_rounded),
            icon: Icon(
              Icons.handshake_outlined,
              color: Color(textColor),
            ),
            label: 'Negotiation\n\t\t\tStatus',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.auto_graph_outlined,
              color: Color(textColor),
            ),
            icon: Icon(
              Icons.auto_graph_rounded,
              color: Color(textColor),
            ),
            label: 'Escalation',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.outbond_rounded,
              color: Color(textColor),
            ),
            icon: Icon(
              Icons.help_outline_outlined,
              color: Color(textColor),
            ),
            label: 'Resources',
          ),
        ]);
  }
}
