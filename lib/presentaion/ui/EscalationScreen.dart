import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/presentaion/ui/adaptor/EscalationAdaptor.dart';
import 'package:loansettle/presentaion/viewmodel/EscalationScreenViewModel.dart';
import 'package:loansettle/utils/BlocEvent.dart';
import 'package:loansettle/utils/FilesUtils.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import '../../domain/model/escalation/EscalationResponse.dart';
import '../../utils/ApiWrapperResponse.dart';
import '../../utils/SealedState.dart';
import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';

class EscalationScreen extends StatefulWidget {
  const EscalationScreen({super.key});

  @override
  State<EscalationScreen> createState() => _EscalationScreenState();
}

class _EscalationScreenState extends State<EscalationScreen> {
  EscalationScreenViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = BlocProvider.of<EscalationScreenViewModel>(context);
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
          title: const Text("Escalation",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(textColor),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: publicSansBold)),
          centerTitle: true),
      body: SealedBlocBuilder4<EscalationScreenViewModel, SealedState, Inital,
              Loading, Success, Error>(
          builder: (context, state) => state((initial) {
                return loading();
              }, (load) {
                return loading();
              }, (success) {
                return successBody(success.data as List<EscalationResponse>);
              }, (e) {
                return error(
                    isValidString(e.error) ? e.e.toString() : e.error!);
              })),
    ));
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

  Widget successBody(List<EscalationResponse> data) {
    return SingleChildScrollView(
      child: listOfEscalationPoint(data, context),
    );
  }
}
