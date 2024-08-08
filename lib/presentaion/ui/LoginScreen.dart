import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/domain/model/login/LoginRequest.dart';
import 'package:loansettle/presentaion/viewmodel/LoginViewModel.dart';
import 'package:loansettle/utils/ApiWrapperResponse.dart';
import 'package:loansettle/utils/BlocEvent.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';
import '../../utils/FilesUtils.dart';
import '../../utils/SealedState.dart';
import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';
import 'dialog/showDialogBox.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = "";
  String _password = "";

  LoginViewModel? _loginViewModel;

  @override
  void initState() {
    super.initState();
    _loginViewModel = BlocProvider.of<LoginViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    //loginViewModel = BlocProvider.of<LoginViewModel>(context);

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 8),
              child: const Text("Log In",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(textColor),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: publicSansBold))),
          Container(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 20, bottom: 8),
              child: const Text("Welcome back",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(textColor),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: publicSansBold))),
          //Email Address
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 35, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Email Address",
                    style: TextStyle(
                        color: Color(textColor),
                        fontFamily: publicSansReg,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: const Color(borderTint), width: 1)),
                  width: MediaQuery.of(context).size.width,
                  height: 56,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autofocus: true,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: publicSansReg,
                        fontSize: 16),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email Address",
                        hintStyle: TextStyle(
                            color: Color(borderTint),
                            fontFamily: publicSansReg,
                            fontSize: 16)),
                    onChanged: (value) {
                      // get the value
                      _email = value;
                    },
                  ),
                )
              ],
            ),
          ),
          //Password
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Password",
                    style: TextStyle(
                        color: Color(textColor),
                        fontFamily: publicSansReg,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: const Color(borderTint), width: 1)),
                  width: MediaQuery.of(context).size.width,
                  height: 56,
                  child: TextFormField(
                    obscureText: true,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: publicSansReg,
                        fontSize: 16),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(
                            color: Color(borderTint),
                            fontFamily: publicSansReg,
                            fontSize: 16)),
                    onChanged: (value) {
                      // get the value
                      _password = value;
                    }
                  ),
                )
              ],
            ),
          ),
          //Forget Password
          GestureDetector(
              onTap: () {
                context.goToNextScreen("/forgetPassword");
              },
              child: Container(
                  alignment: AlignmentDirectional.centerStart,
                  margin: const EdgeInsets.only(
                      top: 4, left: 16, right: 16, bottom: 12),
                  child: const Text("Forget Password?",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: publicSansReg,
                          color: Color(editTextColor))
                  )
              )),
          //Updated Log In
          BlocListener<LoginViewModel, SealedState>(
            listener: (context, state) {
              //print("STATE_CALLED ${state is Loading}");
              state.join(
                  (initial) => {},
                  (loading) => {},
                  (success) => {context.goToNextScreenPopUp("/goTOScreen")},
                  (error) => {
                       // context.goToNextScreenPopUp("/goTOScreen")
                        showDialogBox(
                            context,
                            "Failed",
                            "${isValidString(error.error) ? error.e.toString() : error.error}",
                            true,(){})
                      });
            },
            child: SealedBlocBuilder4<LoginViewModel, SealedState, Inital,
                    Loading, Success, Error>(
                builder: (context, state) => state(
                        (initial) => Container(
                              margin: const EdgeInsets.only(
                                  left: 16, right: 16, top: 12, bottom: 12),
                              child: TextButton(
                                  onPressed: () {
                                    doLogin();
                                  },
                                  style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      minimumSize:
                                          const Size(double.infinity, 55),
                                      backgroundColor:
                                          const Color(buttonColor)),
                                  child: const Text(
                                    "Log In",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: publicSansBold,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                        (loading) => const CircularProgressIndicator(),
                        (success) {
                      return Container(
                        margin: const EdgeInsets.only(
                            left: 16, right: 16, top: 12, bottom: 12),
                        child: TextButton(
                            onPressed: () {
                              doLogin();
                            },
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                minimumSize: const Size(double.infinity, 55),
                                backgroundColor: const Color(buttonColor)),
                            child: const Text(
                              "Log In",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: publicSansBold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            )),
                      );
                    }, (error) {
                      // context.goToNextScreenPopUp("/goTOScreen");
                      /*showDialogBox(context, "Failed",
                      "${error.error == null ? error.error : error.e.toString()}", true);*/
                      return Container(
                        margin: const EdgeInsets.only(
                            left: 16, right: 16, top: 12, bottom: 12),
                        child: TextButton(
                            onPressed: () {
                              doLogin();
                            },
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                minimumSize: const Size(double.infinity, 55),
                                backgroundColor: const Color(buttonColor)),
                            child: const Text(
                              "Log In",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: publicSansBold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            )),
                      );
                    })),
          )
          //New User Information
        ],
      ),
    ));
  }

  void doLogin() {
    if (isValidString(_email) || isValidString(_password)) {
      context.showSnackBar("Please Enter Correct Credentials");
      return;
    }
    debugLogs("ITEM FOR DO LOGIN");
    _loginViewModel?.add(
        DataRequested(data: LoginRequest(email: _email, password: _password)));
  }

  @override
  void dispose() {
    super.dispose();
    _loginViewModel?.close();
  }
}
