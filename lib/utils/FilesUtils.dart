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


class ApiUrl{

  static const String baseurl="https://crm.settleloan.in/";

  static const String loginEndPoint="api/service/VerifyLead";


}