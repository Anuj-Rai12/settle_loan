import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/domain/model/benfitofPermiumPorgram/BenfitOfPermiumProgram.dart';
import 'package:loansettle/presentaion/viewmodel/BenefitOfPermiumViewModel.dart';
import 'package:loansettle/utils/BlocEvent.dart';
import 'package:loansettle/utils/NewTbUrl.dart';
import 'package:loansettle/values/res/Resources.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
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

  Widget sucessBody(List<BenfitPermiumInstance> data) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 320.0,
          floating: false,
          pinned: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              anytimeLawyerIMG,
              width: MediaQuery.of(context).size.width,
              height: 320,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12,top: 12),
            child: const Text("Anytime Lawyer",
                style: TextStyle(
                  color: Color(textColor),
                  fontFamily: publicSansBold,
                  fontSize: 28,
                )),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: const Text(
                "Get access to legal assistance for you and your family. Our team of lawyers can help with a wide  range of issues.",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: publicSansReg,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: const Text("What's Included",
                style: TextStyle(
                  color: Color(textColor),
                  fontFamily: publicSansBold,
                  fontSize: 19,
                )),
          ),
        ),
        anyTimeAdaptor(data, context),
        SliverToBoxAdapter(
          child: Container(
            margin:
            const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
            child: TextButton(
                onPressed: ()  async {
                  String email = Uri.encodeComponent('finane@settleloan.in');
                  String subject = Uri.encodeComponent('ATL subscription');
                  Uri uri = Uri.parse('mailto:$email?subject=$subject');

                  if (await canLaunch(uri.toString())) {
                    await launch(uri.toString());
                  } else {
                    print('Could not launch $uri');
                  }
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    minimumSize: const Size(double.infinity, 55),
                    backgroundColor: const Color(buttonColor)),
                child: const Text(
                  "Subscription Plan",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: publicSansBold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                )),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin:
                const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
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
                  "Explore",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: publicSansBold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                )),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 40),
        )
      ],
    );
  }
}
