
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:loansettle/presentaion/ui/DetailScreen.dart';
import 'package:loansettle/presentaion/ui/InCreaseSibleScoreDetailScreen.dart';
import 'package:loansettle/presentaion/ui/PDFScreen.dart';
import 'package:path_provider/path_provider.dart';

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
  void onBackPress() {
    Navigator.pop(this);
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


  void goToCridetBuilderScreen({required double currentScore, required double achiviedScore, required double time}) {
    Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) =>
            IncreaseCibleScoreDetails(achiveCreditScore: achiviedScore,CurrentCridtScore: currentScore,time: time),
      ),
    );
  }

  void goToPdf(String link) {
    Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) =>
            PDFScreen(path: link),
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

extension clip on BuildContext {
   void copyText(String str) {
    Clipboard.setData(ClipboardData(text: str));
    showSnackBar("copied!!");
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
  static const String complaintAgainstRecoveryAgent =
      "api/details/ComplaintAgainstRecovery";
  static const String negotiationStatusResponse = "api/details/ProcessedData/";
  static const String importantDocEndPoint = "api/details/ImportantDocs";
  static const String benfitOfEndPoint = "api/details/Benefits";

  static const String homeScreenApiEndPoint = "api/details/DashboardInfo/";
}

Future<void> openMap(double latitude, double longitude) async {
  String googleUrl =
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
  FlutterWebBrowser.openWebPage(url: googleUrl);
}



Future<File> createFileOfPdfUrl(String url) async {
  Completer<File> completer = Completer();
  print("Start download file from internet!");
  try {
    // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
    // final url = "https://pdfkit.org/docs/guide.pdf";
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    var dir = await getApplicationDocumentsDirectory();
    print("Download files");
    print("${dir.path}/$filename");
    File file = File("${dir.path}/$filename");

    await file.writeAsBytes(bytes, flush: true);
    completer.complete(file);
  } catch (e) {
    throw Exception('Error parsing asset file!');
  }

  return completer.future;
}