import 'package:flutter/material.dart';
import 'package:loansettle/domain/model/AnyTimeLaywerModel.dart';

import '../../../values/color/Colors.dart';
import '../../../values/fonts/Fonts.dart';

Widget anyTimeAdaptor(List<AnyTimeLawyerModel> arr, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: arr.length,
          itemBuilder: (context, position) {
            var data = arr[position];
            return Container(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  Column(
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
                  )
                ]
              ),
            );
          }),
    ],
  );
}
