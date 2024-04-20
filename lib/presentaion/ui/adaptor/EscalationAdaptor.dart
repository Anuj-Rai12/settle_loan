import 'package:flutter/cupertino.dart';
import 'package:loansettle/domain/model/escalation/EscalationResponse.dart';

import '../../../utils/FilesUtils.dart';
import '../../../values/color/Colors.dart';
import '../../../values/fonts/Fonts.dart';

Widget listOfEscalationPoint(
    List<EscalationResponse> arr, BuildContext context) {
  return Column(
    children: [
      ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: arr.length,
          itemBuilder: (context, position) {
            var data = arr[position];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: !isValidString(data.description),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(editTextBg),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: const EdgeInsets.only(
                        top: 16, left: 16, right: 16, bottom: 16),
                    margin: const EdgeInsets.only(top: 45, right: 16, left: 16),
                    child: Text(
                      data.description ?? "",
                      style: const TextStyle(
                        fontFamily: publicSansReg,
                        fontSize: 22,
                        color: Color(editTextColor),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: !isValidString(data.otherDetails),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(editTextBg),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: const EdgeInsets.only(
                        top: 16, left: 16, right: 16, bottom: 16),
                    margin: const EdgeInsets.only(top: 45, right: 16, left: 16),
                    child: Text(
                      data.otherDetails ?? "",
                      style: const TextStyle(
                        fontFamily: publicSansReg,
                        fontSize: 22,
                        color: Color(editTextColor),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 16, left: 16, right: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Email Address",
                          style: TextStyle(
                            color: Color(textColor),
                            fontFamily: publicSansBold,
                            fontSize: 22,
                          )),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Text(data.email1 ?? "",
                            style: const TextStyle(
                              color: Color(editTextColor),
                              fontFamily: publicSansReg,
                              fontSize: 16,
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Text(data.email2 ?? "",
                            style: const TextStyle(
                              color: Color(editTextColor),
                              fontFamily: publicSansReg,
                              fontSize: 16,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    ],
  );
}
