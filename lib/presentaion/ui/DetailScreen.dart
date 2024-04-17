import 'package:flutter/material.dart';

import '../../utils/FilesUtils.dart';
import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';

class DetailScreen extends StatefulWidget {
  String title;
  String desc;
  String? downloadLink;

  DetailScreen(
      {super.key, required this.desc, required this.title, this.downloadLink});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Color(textColor)),
          title: Text(widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color(textColor),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: publicSansBold)),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 12),
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 16, right: 16),
              child: Text(widget.desc,
                  style: const TextStyle(
                      color: Color(textColor),
                      fontSize: 16,
                      fontFamily: publicSansReg)),
            ),
            Visibility(
                visible: widget.downloadLink != null &&
                    widget.downloadLink!.isNotEmpty,
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 16, right: 16, top: 12, bottom: 12),
                  child: TextButton(
                      onPressed: () {
                        debugLogs("text button clicked");
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          minimumSize: const Size(double.infinity, 55),
                          backgroundColor: const Color(buttonColor)),
                      child: const Text(
                        "Download",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: publicSansBold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      )),
                ))
          ],
        ),
      ),
    ));
  }
}
