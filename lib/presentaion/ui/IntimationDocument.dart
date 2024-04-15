import 'package:flutter/material.dart';
import 'package:loansettle/domain/model/ImportantDocument.dart';
import 'package:loansettle/presentaion/ui/adaptor/ListofImportantDocument.dart';

import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';

class IntimationDocument extends StatefulWidget {
  const IntimationDocument({super.key});

  @override
  State<IntimationDocument> createState() => _IntimationDocumentState();
}

class _IntimationDocumentState extends State<IntimationDocument> {
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
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: listOfImportantDocument(ImportantDocument.list, context),
        ),
      ),
    ));
  }
}
