import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            return Card(
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: !isValidString(data.description),
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 16, left: 16, right: 16, bottom: 16),
                      child: Text(
                        data.description ?? "",
                        style: const TextStyle(
                          fontFamily: publicSansReg,
                          fontSize: 17,
                          color: Color(editTextColor),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !isValidString(data.otherDetails),
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 8, left: 16, right: 16, bottom: 8),
                      child: const Text("Other Information",
                          style: TextStyle(
                            color: Color(textColor),
                            fontFamily: publicSansBold,
                            fontSize: 18,
                          )),
                    ),
                  ),
                  Visibility(
                    visible: !isValidString(data.otherDetails),
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 16, left: 16, right: 16, bottom: 16),
                      child: Text(
                        data.otherDetails ?? "",
                        style: const TextStyle(
                          fontFamily: publicSansReg,
                          fontSize: 16,
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
                              fontSize: 18,
                            )),
                        InkWell(
                          onTap: () {
                            context.copyText(data.email1 ?? "");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: Text(data.email1 ?? "",
                                style: const TextStyle(
                                  color: Color(editTextColor),
                                  fontFamily: publicSansReg,
                                  fontSize: 16,
                                )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context.copyText(data.email2 ?? "");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: Text(data.email2 ?? "",
                                style: const TextStyle(
                                  color: Color(editTextColor),
                                  fontFamily: publicSansReg,
                                  fontSize: 16,
                                )),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    ],
  );
}
