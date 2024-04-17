import 'package:flutter/material.dart';
import 'package:loansettle/domain/model/HelpAndResource.dart';

import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';

class HomeAndResources extends StatefulWidget {
  const HomeAndResources({super.key});

  @override
  State<HomeAndResources> createState() => _HomeAndResourcesState();
}

class _HomeAndResourcesState extends State<HomeAndResources> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Color(textColor)),
          title: const Text("Help & Resources",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(textColor),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: publicSansBold)),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding:
                  const EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
              child: const Text(
                "Here are some common questions people ask about loan settlements. If you can't find what you're looking for, visit our Help Center.",
                style: TextStyle(
                  color: Color(textColor),
                  fontSize: 16,
                  fontFamily: publicSansReg,
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 16, top: 16),
                margin: const EdgeInsets.only(top: 12),
                child: helpAndResourceAdaptor(HelpAndResource.ls, context))
          ],
        ),
      ),
    ));
  }

  Widget helpAndResourceAdaptor(
      List<HelpAndResource> arr, BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, pos) {
        var data = arr[pos];
        return Container(
            color: const Color(editTextBg),
            margin: const EdgeInsets.only(top: 12),
            child: ExpansionTile(
              backgroundColor: const Color(editTextBg),
              title: Text(data.title,
                  style: const TextStyle(
                      fontFamily: publicSansBold,
                      fontSize: 14,
                      color: Color(textColor))),
              children: [
                ListTile(
                    title: Text(data.desc,
                        style: const TextStyle(
                            fontSize: 14,
                            fontFamily: publicSansReg,
                            color: Color(editTextColor)))),
                const SizedBox(height: 15)
              ],
            ));
      },
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: arr.length,
    );
  }
}
