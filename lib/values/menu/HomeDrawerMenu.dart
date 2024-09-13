import 'package:flutter/material.dart';
import 'package:loansettle/data/datastore/LoanSettleSharedPreference.dart';
import 'package:loansettle/data/repo/generateCrLinkRepo.dart';
import 'package:loansettle/domain/model/GoalsAndTraget.dart';
import 'package:loansettle/domain/model/home/HomeScreenResponse.dart';
import 'package:loansettle/presentaion/ui/LoginScreen.dart';
import 'package:loansettle/presentaion/viewmodel/HomeScreenViewModel.dart';
import 'package:loansettle/utils/ApiWrapperResponse.dart';
import 'package:loansettle/utils/FilesUtils.dart';
import 'package:loansettle/utils/SealedState.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../color/Colors.dart';
import '../fonts/Fonts.dart';
import '../res/Resources.dart';

class HomedrawerMenu extends StatefulWidget {
  const HomedrawerMenu({super.key});

  @override
  State<HomedrawerMenu> createState() => _HomedrawerMenuState();
}

class _HomedrawerMenuState extends State<HomedrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return SealedBlocBuilder4<HomeScreenViewModel, SealedState, Inital, Loading,
            Success, Error>(
        builder: (context, state) => state((initial) {
              return const CircularProgressIndicator();
            }, (load) {
              return const CircularProgressIndicator();
            }, (success) {
              return drawer((success.data as List<HomeScreenResponse>)[0]);
            }, (e) {
              return error(isValidString(e.error) ? e.e.toString() : e.error!);
            }));
  }

  Widget error(String error) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Text(error,
            style: const TextStyle(
              color: Color(textColor),
              fontSize: 16,
              fontFamily: publicSansReg,
            )),
      ),
    );
  }

  Widget drawer(HomeScreenResponse data) {
    var clientDetail = data.clientsDetails[0];
    var goal = GoalsAndTarget.createGoal(
        date: clientDetail.startDate,
        emi1: clientDetail.homeLoanEMI ?? "",
        emi2: clientDetail.otherExpenses ?? "",
        amount: clientDetail.loanAmount,
        loanType1: "Monthly Home Loan Amount",
        loanType2: "Monthly Unsecured Loan Amount");
    // debugLogs("PROGRESS ${goal[0].progress} ,${goal[1].progress}");
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(editTextBg)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 86,
                  height: 86,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      profilePic,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(clientDetail.clientName ?? "",
                            style: const TextStyle(
                                fontFamily: publicSansBold,
                                color: Color(textColor),
                                fontSize: 16)),
                        Text(clientDetail.city ?? "",
                            style: const TextStyle(
                                fontFamily: publicSansReg,
                                color: Color(editTextColor),
                                fontSize: 14)),
                        Text(clientDetail.mobile ?? "",
                            style: const TextStyle(
                                fontFamily: publicSansReg,
                                color: Color(editTextColor),
                                fontSize: 14)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          /*  ListTile(
          title: const Text("DashBoard"),
          leading: const Icon(Icons.home),
          focusColor: const Color(editTextBg),
          onTap: () {
            Navigator.pop(context);
          },
        ),*/
          ListTile(
            title: const Text("Credit Builder"),
            leading: const Icon(Icons.credit_card_rounded),
            focusColor: const Color(editTextBg),
            onTap: () {
              Navigator.pop(context);
              context.goToNextScreen("/ciblScore");
            },
          ),
          ListTile(
            title: const Text("Anytime Lawyer"),
            leading: const Icon(Icons.person),
            focusColor: const Color(editTextBg),
            onTap: () {
              Navigator.pop(context);
              context.goToNextScreen("/anyTimeLawyer");
            },
          ),
          ListTile(
            title: const Text("Intimation Letter/Preferred Location Letter"),
            leading: const Icon(Icons.edit_document),
            focusColor: const Color(editTextBg),
            onTap: () {
              Navigator.pop(context);
              context.goToNextScreen("/intimationDoc");
            },
          ),
          ListTile(
            title: const Text("Complaint Against Recovery"),
            leading: const Icon(Icons.details),
            focusColor: const Color(editTextBg),
            onTap: () {
              Navigator.pop(context);
              context.goToNextScreen("/complaintAgainstOfficer");
            },
          ),
          ListTile(
            title: const Text("Negotiation Status"),
            leading: const Icon(Icons.handshake_outlined),
            focusColor: const Color(editTextBg),
            onTap: () {
              Navigator.pop(context);
              context.goToNextScreen("/negoatationSecreen");
            },
          ),

           ListTile(
            title: const Text("Generate CR link"),
            leading: const Icon(Icons.link_rounded),
            focusColor: const Color(editTextBg),
            onTap: () async{
              final response = CrLinkGenrator();
             launchUrl(Uri.parse(await  response.getCrLink()));
            },
          ),

          ListTile(
            title: const Text("What should you do ?"),
            leading: const Icon(Icons.help),
            focusColor: const Color(editTextBg),
            onTap: () {
              Navigator.pop(context);
              context.goToNextScreen("/help&Resource");
            },
          ),
          ListTile(
            title: const Text("Escalation"),
            leading: const Icon(Icons.auto_graph),
            focusColor: const Color(editTextBg),
            onTap: () {
              Navigator.pop(context);
              context.goToNextScreen("/escalation");
            },
          ),
          ListTile(
            title: const Text("Contact Us"),
            leading: const Icon(Icons.support_agent),
            focusColor: const Color(editTextBg),
            onTap: () {
              Navigator.pop(context);
              context.goToNextScreen("/contactUs");
            },
          ),
          ListTile(
            title: const Text("Share"),
            leading: const Icon(Icons.share),
            focusColor: const Color(editTextBg),
            onTap: () {
              Navigator.pop(context);
              Share.share("https://www.settleloan.in/");
            },
          ),
          ListTile(
            title: const Text("Logout"),
            leading: const Icon(Icons.login),
            focusColor: const Color(editTextBg),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text("Are you sure want to logout?",
                            style: TextStyle(fontSize: 17)),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  LoanSettleSharedPreference().logout();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const LoginScreen()),
                                      (route) => false);
                                },
                                child: const Text(
                                  "Yes",
                                  style: TextStyle(fontSize: 15),
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "No",
                                  style: TextStyle(fontSize: 15),
                                )),
                          ],
                        ),
                      ));
            },
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 80),
            margin: const EdgeInsets.only(top: 10),
            child: const Align(
              alignment: FractionalOffset.bottomCenter,
              child: Text(
                "version 1.1",
                style: TextStyle(
                    color: Color(editTextColor),
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
