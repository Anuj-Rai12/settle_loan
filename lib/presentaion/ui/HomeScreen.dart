import 'package:flutter/material.dart';
import 'package:loansettle/domain/model/GoalsAndTraget.dart';
import 'package:loansettle/domain/model/ImportantContactInfomation.dart';
import 'package:loansettle/domain/model/TipsAndResource.dart';
import 'package:loansettle/presentaion/ui/adaptor/GoalsTargetsAdaptor.dart';
import 'package:loansettle/presentaion/ui/adaptor/LaywerInfo.dart';
import 'package:loansettle/utils/FilesUtils.dart';
import 'package:loansettle/values/menu/HomeDrawerMenu.dart';
import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';
import 'adaptor/ResourceAdaptor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      drawer: homeNavigationDrawer(context),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(textColor)),
        title: const Text("Home",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(textColor),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: publicSansReg)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              debugLogs("Clicked with Debug Logs");
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 24, bottom: 12),
                child: const Text(
                  "Welcome Mr.Deepak,",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: publicSansBold,
                      color: Color(textColor)),
                )),
            Container(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 15, bottom: 12),
                child: const Text(
                  "$Rupess_Symbol 15,00,00",
                  style: TextStyle(
                      fontSize: 32,
                      fontFamily: publicSansBold,
                      color: Color(textColor)),
                )),
            Container(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 4, bottom: 12),
                child: const Text(
                  "Total Loan amount Settlement",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: publicSansReg,
                      color: Color(editTextColor)),
                )),
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: RichText(
                  text: const TextSpan(
                      style: TextStyle(
                          color: Color(textColor),
                          fontFamily: publicSansReg,
                          fontSize: 16),
                      children: <TextSpan>[
                    TextSpan(text: "Monthly EMI: "),
                    TextSpan(
                        text: "${Rupess_Symbol}3000",
                        style: TextStyle(fontFamily: publicSansBold))
                  ])),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16, top: 4),
              child: RichText(
                  text: const TextSpan(
                      style: TextStyle(
                          color: Color(textColor),
                          fontFamily: publicSansReg,
                          fontSize: 14),
                      children: <TextSpan>[
                    TextSpan(text: "Start Date: "),
                    TextSpan(
                        text: "20-Nov-2024",
                        style: TextStyle(color: Color(editTextColor)))
                  ])),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text("Contact Agreement",
                  style: TextStyle(
                    color: Color(textColor),
                    fontFamily: publicSansBold,
                    fontSize: 22,
                  )),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: const Text(
                  "Click Below button download the contact agreement settlement tenure with Save Money.",
                  style: TextStyle(
                    color: Color(editTextColor),
                    fontFamily: publicSansReg,
                    fontSize: 14,
                  )),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(
                    left: 16, right: 16, top: 12, bottom: 12),
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {
                        debugLogs("Download Resource");
                        //context.goToNextScreenPopUp("/goTOScreen");
                      },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: const Size(250, 55),
                          side: const BorderSide(color: Color(buttonColor))),
                      icon:
                          const Icon(Icons.download, color: Color(buttonColor)),
                      label: const Text(
                        "Download",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: publicSansBold,
                          color: Color(buttonColor),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text("Important Contact",
                  style: TextStyle(
                    color: Color(textColor),
                    fontFamily: publicSansBold,
                    fontSize: 22,
                  )),
            ),
            listOfImportantContact(
                ImportantContactInformation.contacts, context),
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text("My Goals & Targets",
                  style: TextStyle(
                    color: Color(textColor),
                    fontFamily: publicSansBold,
                    fontSize: 22,
                  )),
            ),
            listOfGoalsAndTargetAdaptor(GoalsAndTarget.list, context),
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text("Tips & Recourse",
                  style: TextStyle(
                    color: Color(textColor),
                    fontFamily: publicSansBold,
                    fontSize: 22,
                  )),
            ),
            listOfResourceAdaptor(TipsAndResource.res, context),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    ));
  }
}
