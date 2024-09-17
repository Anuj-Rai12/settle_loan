import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:downloadsfolder/downloadsfolder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:loansettle/presentaion/ui/DetailScreen.dart';
import 'package:loansettle/presentaion/ui/InCreaseSibleScoreDetailScreen.dart';
import 'package:loansettle/presentaion/ui/PDFScreen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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

  void goToCridetBuilderScreen(
      {required double currentScore,
      required double achiviedScore,
      required double time,
      required String loanAmount}) {
    Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) => IncreaseCibleScoreDetails(
          achiveCreditScore: achiviedScore,
          CurrentCridtScore: currentScore,
          time: time,
          loanAmount: loanAmount,
        ),
      ),
    );
  }

  void goToPdf(String link) {
    Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) => PDFScreen(path: link),
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
  static const String generateCrLinkEndPoint = "api/details/GenerateCRlink/";
}

Future<void> openMap(double latitude, double longitude) async {
  String googleUrl =
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
  FlutterWebBrowser.openWebPage(url: googleUrl);
}

Future<File> createFileOfPdfUrl(String url, BuildContext context) async {
  Completer<File> completer = Completer();
  Map<Permission, PermissionStatus> status = await [
    Permission.storage,
  ].request();
  print("Start download file from internet!");
  try {
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    Directory? dir;


    if (Platform.isAndroid == true) {

      //!Read file in app
      dir = await getDownloadDirectory();
      File file = File("${dir!.path}/$filename");
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);

      
      //! add data in local storage
      if (status[Permission.storage]!.isGranted) {
        if (kIsWeb) {
          //something
        } else {
          Directory downloadDirectory = await getDownloadDirectory();
          String originalString = url.toString();
          String newString = originalString.replaceAll(
              "https://slcrm.settleloan.in/UploadedFiles/", "");
          String savename = newString;
          print(savename);
          String savePath = downloadDirectory.path + "/$savename";
          print("savePath: ${downloadDirectory.path}");
          await Dio().download(url, savePath,
              onReceiveProgress: (received, total) {
            if (total != -1) {
              print((received / total * 100).toStringAsFixed(0) + "%");
              //you can build progressbar feature too
            }
          });
          print("File is saved to download folder: $savePath");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("File Downloaded in download folder"),
          ));
        }
        //! getting file downlaod
      } else {
        print("permission denied");
      }
    }
  } catch (e) {
    throw Exception('Error parsing asset file!: $e');
  }

  return completer.future;
}
