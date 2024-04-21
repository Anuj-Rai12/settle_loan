import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loansettle/presentaion/ui/DetailScreen.dart';

void debugLogs(String msg) {
  if (kDebugMode) {
    print(msg);
  }
}

const String Rupess_Symbol = "₹";

extension navigation on BuildContext {
  void goToNextScreen(String loc) {
    Navigator.pushNamed(this, loc);
  }

  void goToNextScreenPopUp(String loc) {
    Navigator.pushNamedAndRemoveUntil(this, loc, (route) => false);
  }

  void goToDetailScreen(String title, String desc, String? link) {
    Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) =>
            DetailScreen(desc: desc, title: title, downloadLink: link),
      ),
    );
  }
}

extension msg on BuildContext {
  void showSnackBar(String str) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(str),
      ),
    );
  }
}

bool isValidString(String? str) {
  return str == null || str.isEmpty || str == " ";
}

class ApiUrl {
  static const String baseurl = "https://crm.settleloan.in/";

  static const String loginEndPoint = "api/service/VerifyLead";
  static const String forgetPassword = "/api/details/ForgotPassword";

  static const String tipsAndResources = "api/details/HelpResources";
  static const String escalationEndPoint = "api/details/Escalation";
  static const String importantContact = "api/details/ImportantContacts";
  static const String complaintAgainstRecoveryAgent = "api/details/ComplaintAgainstRecovery";
  static const String negotiationStatusResponse = "api/details/ProcessedData/";
  static const String importantDocEndPoint = "api/details/ImportantDocs";
  static const String benfitOfEndPoint = "api/details/Benefits";

}

