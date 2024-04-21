import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/presentaion/viewmodel/ComplaintAgainstRecoveryAgentViewModel.dart';
import 'package:loansettle/utils/BlocEvent.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';
import '../../domain/model/complaintagainstaecoveryagent/ComplainAgainstRecoveryAgent.dart';
import '../../utils/ApiWrapperResponse.dart';
import '../../utils/FilesUtils.dart';
import '../../utils/SealedState.dart';
import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';
import 'adaptor/ComplaintHelpAgainstData.dart';

class ComplaintAgainstRecoveryAgent extends StatefulWidget {
  const ComplaintAgainstRecoveryAgent({super.key});

  @override
  State<ComplaintAgainstRecoveryAgent> createState() =>
      _ComplaintAgainstRecoveryAgentState();
}

class _ComplaintAgainstRecoveryAgentState
    extends State<ComplaintAgainstRecoveryAgent> {
  ComplaintAgainstRecoveryAgentViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel =
        BlocProvider.of<ComplaintAgainstRecoveryAgentViewModel>(context);
    _viewModel?.add(DataRequested(data: null));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                iconTheme: const IconThemeData(color: Color(textColor)),
                title: const Text("Complaint Against Recovery Agent",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(textColor),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: publicSansBold)),
                centerTitle: true),
            body: SealedBlocBuilder4<ComplaintAgainstRecoveryAgentViewModel,
                    SealedState, Inital, Loading, Success, Error>(
                builder: (context, state) => state((initial) {
                      return loading();
                    }, (load) {
                      return loading();
                    }, (success) {
                      debugLogs("Success hit");
                      return successBody(
                          success.data as ComplainAgainstRecoveryAgent);
                    }, (e) {
                      return error(
                          isValidString(e.error) ? e.e.toString() : e.error!);
                    }))));
  }

  Widget loading() {
    return const Center(child: CircularProgressIndicator());
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

  Widget successBody(ComplainAgainstRecoveryAgent data) {
    return SingleChildScrollView(
        child: Column(
      children: [
        complaintHelpAgainstData(data, context),
        const SizedBox(height: 60)
      ],
    ));
  }
}
