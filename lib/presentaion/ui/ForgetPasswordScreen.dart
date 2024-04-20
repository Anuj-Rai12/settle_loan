import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/presentaion/viewmodel/ForgetPasswordViewModel.dart';
import 'package:loansettle/utils/BlocEvent.dart';
import 'package:loansettle/utils/SealedState.dart';
import 'package:loansettle/values/fonts/Fonts.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';
import '../../utils/ApiWrapperResponse.dart';
import '../../utils/FilesUtils.dart';
import '../../values/color/Colors.dart';
import '../viewmodel/LoginViewModel.dart';
import 'dialog/showDialogBox.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  ForgetPasswordViewModel? _viewModel;
  String _email = "";

  @override
  void initState() {
    super.initState();
    _viewModel = BlocProvider.of<ForgetPasswordViewModel>(context);
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
          title: const Text("Forget Password?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(textColor),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: publicSansBold)),
          centerTitle: true),
      body: Column(
        children: [
          //Email Address
          Container(
            margin:
                const EdgeInsets.only(left: 16, right: 16, top: 55, bottom: 12),
            padding: const EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(editTextBg)),
            width: MediaQuery.of(context).size.width,
            height: 56,
            child: TextFormField(
              autofocus: true,
              style: const TextStyle(
                  color: Color(editTextColor),
                  fontFamily: publicSansReg,
                  fontSize: 16),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter your Registered Email Address",
                  hintStyle: TextStyle(
                      color: Color(editTextColor),
                      fontFamily: publicSansReg,
                      fontSize: 16)),
              onChanged: (value) {
                // get the value
                _email = value;
              },
            ),
          ),
          //Forget Password
          BlocListener<ForgetPasswordViewModel, SealedState>(
            listener: (context, state) {
              state.join((p0) => null, (p0) => null,
                  (success) => showSnackBar("${success.data}"), (error) {
                showDialogBox(
                    context,
                    "Failed",
                    "${isValidString(error.error) ? error.e.toString() : error.error}",
                    true,
                    () {});
              });
            },
            child: SealedBlocBuilder4<LoginViewModel, SealedState, Inital,
                Loading, Success, Error>(
              builder: (context, state) => state((initial) {
                return loginButton();
              }, (loading) {
                return this.loading();
              }, (success) {
                return loginButton();
              }, (error) {
                return loginButton();
              }),
            ),
          )
          //New User Information
        ],
      ),
    ));
  }

  Widget loading() {
    return const CircularProgressIndicator();
  }

  Widget loginButton() {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
      child: TextButton(
          onPressed: () {
            onClick();
          },
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              minimumSize: const Size(double.infinity, 55),
              backgroundColor: const Color(buttonColor)),
          child: const Text(
            "Submit",
            style: TextStyle(
                fontSize: 16, fontFamily: publicSansBold, color: Colors.white),
            textAlign: TextAlign.center,
          )),
    );
  }

  void onClick() {
    if (isValidString(_email)) {
      context.showSnackBar("Please Add Register Email");
      return;
    }
    _viewModel?.add(DataRequested(data: _email));
  }

  void showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(msg),
        action: SnackBarAction(
          label: 'Got it',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
