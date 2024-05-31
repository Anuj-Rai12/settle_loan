import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';
import '../../values/res/Resources.dart';

class AstroSignScreen extends StatefulWidget {
  const AstroSignScreen({super.key});

  @override
  State<AstroSignScreen> createState() => _AstroSignScreenState();
}

class _AstroSignScreenState extends State<AstroSignScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Color(textColor)),
          title: const Text("AstroSigns",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(textColor),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: publicSansBold)),
          centerTitle: true),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 12),
            child: const Text("Mantra Recitation",
                style: TextStyle(
                  color: Color(textColor),
                  fontFamily: publicSansBold,
                  fontSize: 22,
                )),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 12),
            child: const Text(
                "Earn points for reciting Om Namah Shivaya. 1000 recitations = 1 point.",
                style: TextStyle(
                  color: Color(textColor),
                  fontFamily: publicSansReg,
                  fontSize: 16,
                )),
          ),
          Container(
            margin: const EdgeInsets.only(
                left: 16, right: 16, top: 16, bottom: 16),
            child: Row(
              children: [
                SizedBox(
                  width: 56,
                  height: 56,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    // This makes the corners circular
                    child: FadeInImage.assetNetwork(
                      image: "",
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(document1, fit: BoxFit.cover);
                      },
                      fit: BoxFit.cover,
                      placeholder:
                          profilePic, // This ensures the image covers the box without stretching
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("OM NAMAH SHIVAYA",
                          style: TextStyle(
                              fontFamily: publicSansBold,
                              color: Color(textColor),
                              fontSize: 16)),
                      Text("Recite Mantra",
                          style: TextStyle(
                              fontFamily: publicSansReg,
                              color: Color(editTextColor),
                              fontSize: 14))
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Count",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: publicSansBold,
                        color: Color(textColor))),
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  margin: const EdgeInsets.only(top: 8, right: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border:
                          Border.all(color: const Color(borderTint), width: 1)),
                  width: MediaQuery.of(context).size.width,
                  height: 56,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: publicSansReg,
                        fontSize: 16),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Number",
                        hintStyle: TextStyle(
                            color: Color(borderTint),
                            fontFamily: publicSansReg,
                            fontSize: 16)),
                    onChanged: (value) {
                      // get the value
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              minimumSize: const Size(double.infinity, 55),
                              backgroundColor: const Color(editTextBg)),
                          child: const Text(
                            "Submit Proof",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: publicSansBold,
                                color: Color(textColor)),

                            textAlign: TextAlign.center,
                          )),
                    )),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            minimumSize: const Size(double.infinity, 55),
                            backgroundColor: const Color(buttonColor)),
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: publicSansBold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16,right: 16,top: 10),
            child: const Text(
              "You can submit proof to earn points that discount your monthly fee.",
                style:TextStyle(
                color: Color(editTextColor),
              fontFamily: publicSansReg,
              fontSize: 16)
            ),
          ),
          const SizedBox(height: 150),
          Container(
            margin: const EdgeInsets.only(
                left: 16, right: 16, top: 12, bottom: 12),
            child: TextButton(
                onPressed: () {
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    minimumSize: const Size(double.infinity, 55),
                    backgroundColor: const Color(buttonColor)),
                child: const Text(
                  "Done",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: publicSansBold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                )),
          )
        ],
      ),
    ));
  }
}
