import 'package:flutter/material.dart';
import 'package:loansettle/domain/model/ComplaintAgainstData.dart';
import 'package:loansettle/values/fonts/Fonts.dart';

import '../../../values/color/Colors.dart';

Widget complaintHelpAgainstData(List<ComplainAgainstData> arr,
    BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
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
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 20, bottom: 12),
                  child: Text(data.title, style: const TextStyle(
                      fontSize: 22,
                      fontFamily: publicSansBold
                  )),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: data.content.length,
                    itemBuilder: (con, pos) {
                      var content = data.content[pos];
                      return InkWell(
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
                                      content.logo,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(content.contactPosition,
                                            style: const TextStyle(
                                                fontFamily: publicSansBold,
                                                color: Color(textColor),
                                                fontSize: 16)),
                                        Container(
                                          margin: const EdgeInsets.only(top: 5),
                                          child: Text(content.otherDetails,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontFamily: publicSansReg,
                                                  color: Color(editTextColor),
                                                  fontSize: 14)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Icon(Icons.navigate_next_sharp,
                                    color: Color(textColor))
                              ],
                            ),
                          ));
                    })
              ],
            );
          }),
    ],
  );
}