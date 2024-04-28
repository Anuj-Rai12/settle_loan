

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/domain/model/GoalsAndTraget.dart';
import 'package:loansettle/domain/model/home/HomeScreenResponse.dart';
import 'package:loansettle/presentaion/ui/adaptor/GoalsTargetsAdaptor.dart';
import 'package:loansettle/presentaion/ui/adaptor/LaywerInfo.dart';
import 'package:loansettle/presentaion/viewmodel/HomeScreenViewModel.dart';
import 'package:loansettle/utils/BlocEvent.dart';
import 'package:loansettle/utils/FilesUtils.dart';
import 'package:loansettle/values/menu/HomeDrawerMenu.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';
import '../../utils/ApiWrapperResponse.dart';
import '../../utils/SealedState.dart';
import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';
import 'adaptor/ResourceAdaptor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = BlocProvider.of<HomeScreenViewModel>(context);
    _viewModel?.add(DataRequested(data: null));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SealedBlocBuilder4<HomeScreenViewModel, SealedState, Inital,
                Loading, Success, Error>(
            builder: (context, state) => state((initial) {
                  return loading();
                }, (load) {
                  return loading();
                }, (success) {
                  return successBody(
                      (success.data as List<HomeScreenResponse>)[0]);
                }, (e) {
                  return error(
                      isValidString(e.error) ? e.e.toString() : e.error!);
                })));
  }

  Widget loading() {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator()));
  }

  Widget error(String error) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Text(error,
              style: const TextStyle(
                color: Color(textColor),
                fontSize: 16,
                fontFamily: publicSansReg,
              )),
        ),
      ),
    );
  }

  Widget successBody(HomeScreenResponse data) {
    var clientDetail = data.clientsDetails?[0];
    var goal = GoalsAndTarget.createGoal(
        clientDetail?.startDate ?? "",
        clientDetail?.homeLoanEMI ?? "",
        clientDetail?.otherExpenses ?? "",
        clientDetail?.loanAmount ?? "",
        "Monthly Home Loan Amount",
        "Monthly Other Loan Amount");
    debugLogs("PROGRESS ${goal[0].progress} ,${goal[1].progress}");
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: homeNavigationDrawer(context, data),
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
              context.showSnackBar("No Notification yet");
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
                child: Text(
                  "Welcome ${clientDetail?.clientName ?? ""},",
                  style: const TextStyle(
                      fontSize: 20,
                      fontFamily: publicSansBold,
                      color: Color(textColor)),
                )),
            Container(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 15, bottom: 12),
                child: Text(
                  "$Rupess_Symbol ${clientDetail?.loanAmount}",
                  style: const TextStyle(
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
                  text: TextSpan(
                      style: const TextStyle(
                          color: Color(textColor),
                          fontFamily: publicSansReg,
                          fontSize: 16),
                      children: <TextSpan>[
                    const TextSpan(text: "Monthly EMI: "),
                    TextSpan(
                        text: "$Rupess_Symbol${clientDetail?.eMI ?? ""}",
                        style: const TextStyle(fontFamily: publicSansBold))
                  ])),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16, top: 4),
              child: RichText(
                  text: TextSpan(
                      style: const TextStyle(
                          color: Color(textColor),
                          fontFamily: publicSansReg,
                          fontSize: 14),
                      children: <TextSpan>[
                    const TextSpan(text: "Start Date: "),
                    TextSpan(
                        text: clientDetail?.startDate ?? "",
                        style: const TextStyle(color: Color(editTextColor)))
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
                        context.goToPdf(
                            "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf");
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
            Visibility(
              visible: data.importantContacts != null &&
                  data.importantContacts!.isNotEmpty,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: const Text("Important Contact",
                    style: TextStyle(
                      color: Color(textColor),
                      fontFamily: publicSansBold,
                      fontSize: 22,
                    )),
              ),
            ),
            listOfImportantContact(data.importantContacts ?? [], context),
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text("My Goals & Targets",
                  style: TextStyle(
                    color: Color(textColor),
                    fontFamily: publicSansBold,
                    fontSize: 22,
                  )),
            ),
            listOfGoalsAndTargetAdaptor(goal, context),
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text("Tips & Recourse",
                  style: TextStyle(
                    color: Color(textColor),
                    fontFamily: publicSansBold,
                    fontSize: 22,
                  )),
            ),
            listOfResourceAdaptor(data.tipsResources ?? [], context),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
