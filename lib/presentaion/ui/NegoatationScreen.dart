import 'package:flutter/material.dart';
import 'package:loansettle/domain/model/NegotiationScreenModel.dart';
import 'package:loansettle/utils/FilesUtils.dart';
import '../../values/color/Colors.dart';
import '../../values/fonts/Fonts.dart';

class NegotiationScreen extends StatefulWidget {
  const NegotiationScreen({super.key});

  @override
  State<NegotiationScreen> createState() => _NegotiationScreenState();
}

class _NegotiationScreenState extends State<NegotiationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Color(textColor)),
          title: const Text("Negotiation Status",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(textColor),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: publicSansBold)),
          centerTitle: true),
      body: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: NegotiationScreenModel.ls.length,
          itemBuilder: (context, position) {
            var data = NegotiationScreenModel.ls[position];
            return Container(
              decoration: const BoxDecoration(
                color: Color(editTextBg),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              margin: const EdgeInsets.only(left: 16,right: 16,top: 12),
              child: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 16, right: 16, top: 16, bottom: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 56,
                          height: 56,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            // This makes the corners circular
                            child: Image.asset(
                              data.src,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.bankName,
                                    style: const TextStyle(
                                        fontFamily: publicSansBold,
                                        color: Color(textColor),
                                        fontSize: 18)),
                                Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  child: const Text(
                                      "Possibility of Settlement Read.",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: publicSansReg,
                                          color: Color(textColor),
                                          fontSize: 16)),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  child: Text("$Rupess_Symbol ${data.possibilty}",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontFamily: publicSansReg,
                                          color: Color(editTextColor),
                                          fontSize: 14)),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  child: const Text(
                                      "Status of amt. as of agreement",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: publicSansReg,
                                          color: Color(textColor),
                                          fontSize: 16)),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  child: Text(
                                      "$Rupess_Symbol ${data.statusAggrement}",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontFamily: publicSansReg,
                                          color: Color(editTextColor),
                                          fontSize: 14)),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  child: const Text(
                                      "Current amount offered (including  o/s)",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: publicSansReg,
                                          color: Color(textColor),
                                          fontSize: 16)),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  child: Text("$Rupess_Symbol ${data.current}",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontFamily: publicSansReg,
                                          color: Color(editTextColor),
                                          fontSize: 14)),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            );
          }),
    ));
  }
}
