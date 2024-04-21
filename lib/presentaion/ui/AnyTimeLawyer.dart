import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/domain/model/benfitofPermiumPorgram/BenfitOfPermiumProgram.dart';
import 'package:loansettle/presentaion/viewmodel/BenefitOfPermiumViewModel.dart';
import 'package:loansettle/utils/BlocEvent.dart';
import 'package:loansettle/utils/NewTbUrl.dart';
import 'package:loansettle/values/res/Resources.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';
import '../../utils/ApiWrapperResponse.dart';
import '../../utils/FilesUtils.dart';
import '../../utils/SealedState.dart';
import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';
import '../../values/string/Strings.dart';
import 'adaptor/AnyTimeAdaptor.dart';

class AnyTimeLawyer extends StatefulWidget {
  const AnyTimeLawyer({super.key});

  @override
  State<AnyTimeLawyer> createState() => _AnyTimeLawyerState();
}

class _AnyTimeLawyerState extends State<AnyTimeLawyer> {
  BenefitOfPermiumViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = BlocProvider.of<BenefitOfPermiumViewModel>(context);
    _viewModel?.add(DataRequested(data: null));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SealedBlocBuilder4<BenefitOfPermiumViewModel, SealedState, Inital,
          Loading, Success, Error>(
          builder: (context, state) => state((initial) {
            return loading();
          }, (load) {
            return loading();
          }, (success) {
            return sucessBody(success.data as List<BenfitPermiumInstance>);
          }, (e) {
            return error(
                isValidString(e.error) ? e.e.toString() : e.error!);
          })),
    );
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

  Widget sucessBody(List<BenfitPermiumInstance> data){
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                anytimeLawyerIMG,
                width: MediaQuery.of(context).size.width,
                height: 320,
                fit: BoxFit.fitWidth,
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 12),
                child: const Text("Anytime Lawyer",
                    style: TextStyle(
                      color: Color(textColor),
                      fontFamily: publicSansBold,
                      fontSize: 28,
                    )),
              ),
              Container(
                padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: const Text(
                    "Get access to legal assistance for you and your family. Our team of lawyers can help with a wide  range of issues.",
                    style: TextStyle(
                      color: Color(editTextColor),
                      fontFamily: publicSansReg,
                      fontSize: 14,
                    )),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: const Text("What's Included",
                    style: TextStyle(
                      color: Color(textColor),
                      fontFamily: publicSansBold,
                      fontSize: 18,
                    )),
              ),
              anyTimeAdaptor(data, context)
            ],
          ),
          Container(
            margin: const EdgeInsets.only(
                left: 16, right: 16, top: 12, bottom: 12),
            child: TextButton(
                onPressed: () {
                  debugLogs("text button clicked");
                  context.openNewTab(loanSettlementApp);
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    minimumSize: const Size(double.infinity, 55),
                    backgroundColor: const Color(buttonColor)),
                child: const Text(
                  "Try Now!!",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: publicSansBold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                )),
          )
        ],
      ),
    );
  }
}
