import 'package:flutter/material.dart';
import 'package:loansettle/domain/model/TipsAndResource.dart';
import '../../../values/color/Colors.dart';
import '../../../values/fonts/Fonts.dart';

listOfResourceAdaptor(List<TipsAndResource> arr, BuildContext context) {
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
                      const Icon(Icons.arrow_forward_ios,
                          color: Color(textColor))
                    ],
                  ),
                ));
          }),
    ],
  );
}
