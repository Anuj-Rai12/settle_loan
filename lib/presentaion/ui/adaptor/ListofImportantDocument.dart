import 'package:flutter/material.dart';
import 'package:loansettle/domain/model/ImportantDocument.dart';
import 'package:loansettle/utils/FilesUtils.dart';

import '../../../values/color/Colors.dart';
import '../../../values/fonts/Fonts.dart';

Widget listOfImportantDocument(
    List<ImportantDocument> arr, BuildContext context) {
  return Column(
    children: [
      ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: arr.length,
          itemBuilder: (context, position) {
            var data = arr[position];
            return InkWell(
                onTap: () {
                  context.goToDetailScreen(data.title,data.desc,data.path);
                },
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
                            data.image,
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
                              Text(data.title,
                                  style: const TextStyle(
                                      fontFamily: publicSansBold,
                                      color: Color(textColor),
                                      fontSize: 16)),
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: Text(data.desc,
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
          }),
    ],
  );
}
