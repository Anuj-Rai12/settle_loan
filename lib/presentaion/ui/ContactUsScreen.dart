import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/domain/model/contacts/ImportantContactsResponse.dart';
import 'package:loansettle/presentaion/viewmodel/ImportantContactViewModel.dart';
import 'package:loansettle/utils/BlocEvent.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';
import '../../utils/ApiWrapperResponse.dart';
import '../../utils/FilesUtils.dart';
import '../../utils/SealedState.dart';
import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';
import 'adaptor/LaywerInfo.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  ImportantContactViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = BlocProvider.of<ImportantContactViewModel>(context);
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
          title: const Text("Contact Us",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(textColor),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: publicSansBold)),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Company Name",
                            style: TextStyle(
                              color: Color(textColor),
                              fontFamily: publicSansBold,
                              fontSize: 16,
                            )),
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          child: const Text("Settle Loan pvt.Ltd",
                              style: TextStyle(
                                color: Color(editTextColor),
                                fontFamily: publicSansReg,
                                fontSize: 14,
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Address",
                              style: TextStyle(
                                color: Color(textColor),
                                fontFamily: publicSansBold,
                                fontSize: 16,
                              )),
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            child: const Text(
                                "Block G, Sushant Lok 2, Sector 57, Gurugram, Haryana 122003",
                                style: TextStyle(
                                  color: Color(editTextColor),
                                  fontFamily: publicSansReg,
                                  fontSize: 14,
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Email ID",
                              style: TextStyle(
                                color: Color(textColor),
                                fontFamily: publicSansBold,
                                fontSize: 16,
                              )),
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            child: const Text("info@settleloan.in",
                                style: TextStyle(
                                  color: Color(editTextColor),
                                  fontFamily: publicSansReg,
                                  fontSize: 14,
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Contact Number",
                              style: TextStyle(
                                color: Color(textColor),
                                fontFamily: publicSansBold,
                                fontSize: 16,
                              )),
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            child: const Text("1800-309-1902",
                                style: TextStyle(
                                  color: Color(editTextColor),
                                  fontFamily: publicSansReg,
                                  fontSize: 14,
                                )),
                          )
                        ],
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
            SealedBlocBuilder4<ImportantContactViewModel, SealedState, Inital,
                    Loading, Success, Error>(
                builder: (context, state) => state((inital) {
                      return loading();
                    }, (loading) {
                      return this.loading();
                    }, (success) {
                      return successBody(
                          success.data as List<ImportantContacts>);
                    }, (e) {
                      return error(
                          isValidString(e.error) ? e.e.toString() : e.error!);
                    }))
          ],
        ),
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

  Widget successBody(List<ImportantContacts> data) {
    return listOfImportantContact(data, context);
  }
}
