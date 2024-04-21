import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/presentaion/ui/adaptor/ListofImportantDocument.dart';
import 'package:loansettle/presentaion/viewmodel/ImportantDocumentViewModel.dart';
import 'package:loansettle/utils/BlocEvent.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';
import '../../domain/model/importantdocument/ImportantDocument.dart';
import '../../utils/ApiWrapperResponse.dart';
import '../../utils/FilesUtils.dart';
import '../../utils/SealedState.dart';
import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';

class IntimationDocument extends StatefulWidget {
  const IntimationDocument({super.key});

  @override
  State<IntimationDocument> createState() => _IntimationDocumentState();
}

class _IntimationDocumentState extends State<IntimationDocument> {

  ImportantDocumentViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel=BlocProvider.of<ImportantDocumentViewModel>(context);
    _viewModel?.add(DataRequested(data: null));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Color(textColor)),
          title: const Text("Important Document",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(textColor),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: publicSansBold)),
          centerTitle: true),
      backgroundColor: Colors.white,
      body:  SealedBlocBuilder4<ImportantDocumentViewModel, SealedState, Inital,
          Loading, Success, Error>(
          builder: (context, state) => state((initial) {
            return loading();
          }, (load) {
            return loading();
          }, (success) {
            return successBody(success.data as List<ImportantDocument>);
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


  Widget successBody(List<ImportantDocument> arr){
    return  Container(
      margin: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        child: listOfImportantDocument(arr, context),
      ),
    );
  }

}
