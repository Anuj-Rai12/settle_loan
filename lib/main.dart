import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loansettle/data/datastore/LoanSettleSharedPreference.dart';
import 'package:loansettle/presentaion/ui/AnyTimeLawyer.dart';
import 'package:loansettle/presentaion/ui/AppGoToScreen.dart';
import 'package:loansettle/presentaion/ui/ComplaintAgainstRecoveryAgent.dart';
import 'package:loansettle/presentaion/ui/ContactUsScreen.dart';
import 'package:loansettle/presentaion/ui/EscalationScreen.dart';
import 'package:loansettle/presentaion/ui/ForgetPasswordScreen.dart';
import 'package:loansettle/presentaion/ui/HelpAndResourcesScreen.dart';
import 'package:loansettle/presentaion/ui/HomeScreen.dart';
import 'package:loansettle/presentaion/ui/IncreaseCiblScore.dart';
import 'package:loansettle/presentaion/ui/IntimationDocument.dart';
import 'package:loansettle/presentaion/ui/LoginScreen.dart';
import 'package:loansettle/presentaion/ui/MainActvitiy.dart';
import 'package:loansettle/presentaion/ui/MylawyerScreen.dart';
import 'package:loansettle/presentaion/ui/NegoatationScreen.dart';
import 'package:loansettle/presentaion/ui/SplashScreen.dart';
import 'package:loansettle/presentaion/viewmodel/EscalationScreenViewModel.dart';
import 'package:loansettle/presentaion/viewmodel/ForgetPasswordViewModel.dart';
import 'package:loansettle/presentaion/viewmodel/LoginViewModel.dart';
import 'package:loansettle/presentaion/viewmodel/TipsAndResoucesViewModel.dart';
import 'package:loansettle/values/color/Colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  LoanSettleSharedPreference();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginViewModel()),
          BlocProvider(create: (context) => TipsAndResourcesViewModel()),
          BlocProvider(create: (context) => EscalationScreenViewModel()),
          BlocProvider(create: (context) => ForgetPasswordViewModel()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: myCustomColor,
            brightness: Brightness.light,
            hintColor: const Color(editTextBg),
          ),
          title: "Settle Loan",
          debugShowCheckedModeBanner: false,
          home: const AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark),
              child: MainSplashScreen()),
          routes: {
            "/goTOScreen": (context) => const AppGoToScreen(),
            "/loginScreen": (context) => const LoginScreen(),
            "/forgetPassword": (context) => const ForgetPasswordScreen(),
            "/homeScreen": (context) => const HomeScreen(),
            "/myLawyerScreen": (context) => const MyLawyerScreen(),
            "/negoatationSecreen": (context) => const NegotiationScreen(),
            "/MainActivity": (context) => const MainActivity(),
            "/contactUs": (context) => const ContactUsScreen(),
            "/complaintAgainstOfficer": (context) =>
                const ComplaintAgainstRecoveryAgent(),
            "/intimationDoc": (context) => const IntimationDocument(),
            "/escalation": (context) => const EscalationScreen(),
            "/ciblScore": (context) => const IncreaseCIBLScore(),
            "/anyTimeLawyer": (context) => const AnyTimeLawyer(),
            "/help&Resource": (context) => const HelpAndResourcesScreen(),
          },
        ));
  }
}
