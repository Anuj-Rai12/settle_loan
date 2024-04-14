import 'package:flutter/material.dart';
import 'package:loansettle/domain/model/ImportantContactInfomation.dart';
import 'package:loansettle/values/fonts/Fonts.dart';

import '../../../values/color/Colors.dart';

Widget listOfImportantContact(
    List<ImportantContactInformation> arr, BuildContext context) {
  return Column(
    children: [
      ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: arr.length,
          itemBuilder: (context, position) {
            var data = arr[position];
            return InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 16),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 56,
                        height: 56,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(28),
                          // This makes the corners circular
                          child: Image.asset(
                            data.src,
                            fit: BoxFit
                                .cover, // This ensures the image covers the box without stretching
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.title,
                                style: const TextStyle(
                                    fontFamily: publicSansBold,
                                    color: Color(textColor),
                                    fontSize: 16)),
                            Text(data.name,
                                style: const TextStyle(
                                    fontFamily: publicSansReg,
                                    color: Color(editTextColor),
                                    fontSize: 14)),
                            Text(data.phoneNumber,
                                style: const TextStyle(
                                    fontFamily: publicSansReg,
                                    color: Color(editTextColor),
                                    fontSize: 14)),
                            Text(data.email,
                                style: const TextStyle(
                                    fontFamily: publicSansReg,
                                    color: Color(editTextColor),
                                    fontSize: 14)),
                          ],
                        ),
                      )
                    ],
                  ),
                ));
          }),
    ],
  );
}
