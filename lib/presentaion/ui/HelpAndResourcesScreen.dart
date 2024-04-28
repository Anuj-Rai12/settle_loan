import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/presentaion/viewmodel/TipsAndResoucesViewModel.dart';
import 'package:loansettle/utils/BlocEvent.dart';
import 'package:loansettle/utils/FilesUtils.dart';
import 'package:loansettle/utils/SealedState.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';
import '../../domain/model/helpandresource/HelpAndResources.dart';
import '../../utils/ApiWrapperResponse.dart';
import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';

class HelpAndResourcesScreen extends StatefulWidget {
  const HelpAndResourcesScreen({super.key});

  @override
  State<HelpAndResourcesScreen> createState() => _HelpAndResourcesScreenState();
}

class _HelpAndResourcesScreenState extends State<HelpAndResourcesScreen> {
  TipsAndResourcesViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = BlocProvider.of<TipsAndResourcesViewModel>(context);
    _viewModel?.add(DataRequested(data: ""));
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
          title: const Text("Help & Resources",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(textColor),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: publicSansBold)),
          centerTitle: true),
      body: SealedBlocBuilder4<TipsAndResourcesViewModel, SealedState, Inital,
          Loading, Success, Error>(
        builder: (context, state) => state((inital) {
          return loading();
        }, (pb) {
          return loading();
        }, (success) {
          return successBody(success.data as HelpAndResources);
        }, (e) {
          return error(isValidString(e.error) ? e.e.toString() : e.error!);
        }),
      ),
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

  Widget successBody(HelpAndResources data) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding:
                const EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
            child: Text(
              data.description ?? "",
              style: const TextStyle(
                color: Color(textColor),
                fontSize: 18,
                fontFamily: publicSansReg,
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16, top: 16),
              margin: const EdgeInsets.only(top: 12),
              child: helpAndResourceAdaptor(data.data ?? [], context))
        ],
      ),
    );
  }

  Widget helpAndResourceAdaptor(List<TipsData> arr, BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, pos) {
        var data = arr[pos];
        return Container(
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    color: const Color(borderTint), width: 1)),
            margin: const EdgeInsets.only(top: 16, bottom: 16),
            child: ExpansionTile(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(borderTint)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Text(data.question ?? "",
                  style: const TextStyle(
                      fontFamily: publicSansBold,
                      fontSize: 18,
                      color: Color(textColor))),
              children: [
                ListTile(
                    title: Text(data.answer ?? "",
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: publicSansReg,
                            color: Color(textColor)))),
                const SizedBox(height: 15)
              ],
            ));
      },
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: arr.length,
    );
  }
}
