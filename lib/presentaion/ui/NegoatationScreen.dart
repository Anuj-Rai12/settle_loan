import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/presentaion/viewmodel/NegotiationStatusViewModel.dart';
import 'package:loansettle/utils/FilesUtils.dart';
import 'package:loansettle/values/res/Resources.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';
import '../../domain/model/negoationstatus/NegotiationStatusResponse.dart';
import '../../utils/ApiWrapperResponse.dart';
import '../../utils/BlocEvent.dart';
import '../../utils/SealedState.dart';
import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';

class NegotiationScreen extends StatefulWidget {
  const NegotiationScreen({super.key});

  @override
  State<NegotiationScreen> createState() => _NegotiationScreenState();
}

class _NegotiationScreenState extends State<NegotiationScreen> {
  NegotiationStatusViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = BlocProvider.of<NegotiationStatusViewModel>(context);
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
          title: const Text("Negotiation Status",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(textColor),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: publicSansBold)),
          centerTitle: true),
      body:  SealedBlocBuilder4<NegotiationStatusViewModel, SealedState, Inital,
          Loading, Success, Error>(
          builder: (context, state) => state((initial) {
            return loading();
          }, (load) {
            return loading();
          }, (success) {
            return successBody(success.data as List<NegotiationStatus>);
          }, (e) {
            return error(
                isValidString(e.error) ? e.e.toString() : e.error!);
          }))
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


  Widget successBody(List<NegotiationStatus> arr){
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: arr.length,
              itemBuilder: (context, position) {
                var data = arr[position];
                return Container(
                  decoration: const BoxDecoration(
                      color: Color(editTextBg),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  margin: const EdgeInsets.only(left: 16, right: 16, top: 12),
                  child: InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 16, right: 16, top: 16, bottom: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 56,
                              height: 56,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                // This makes the corners circular
                                child: Image.asset(
                                  bankLogo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(data.bank??"",
                                        style: const TextStyle(
                                            fontFamily: publicSansBold,
                                            color: Color(textColor),
                                            fontSize: 18)),
                                    Container(
                                      margin: const EdgeInsets.only(top: 8),
                                      child: const Text(
                                          "Possibility of Settlement Read.",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: publicSansReg,
                                              color: Color(textColor),
                                              fontSize: 16)),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 8),
                                      child: Text(
                                          "$Rupess_Symbol ${data.possibilityofSettlementAcqired}",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontFamily: publicSansReg,
                                              color: Color(editTextColor),
                                              fontSize: 14)),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 8),
                                      child: const Text(
                                          "Status of amt. as of agreement",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: publicSansReg,
                                              color: Color(textColor),
                                              fontSize: 16)),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 8),
                                      child: Text(
                                          "$Rupess_Symbol ${data.agreementStatusAmt}",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontFamily: publicSansReg,
                                              color: Color(editTextColor),
                                              fontSize: 14)),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 8),
                                      child: const Text(
                                          "Current amount offered (including  o/s)",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: publicSansReg,
                                              color: Color(textColor),
                                              fontSize: 16)),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 8),
                                      child: Text(
                                          "$Rupess_Symbol ${data.currentAmountOfferred}",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontFamily: publicSansReg,
                                              color: Color(editTextColor),
                                              fontSize: 14)),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                );
              }),
          const SizedBox(height: 60)
        ],
      ),
    );
  }
}
