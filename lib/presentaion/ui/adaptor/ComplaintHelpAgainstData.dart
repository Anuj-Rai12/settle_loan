import 'package:flutter/material.dart';
import 'package:loansettle/domain/model/ComplaintAgainstData.dart';
import 'package:loansettle/utils/FilesUtils.dart';
import 'package:loansettle/values/fonts/Fonts.dart';
import '../../../domain/model/HelplineData.dart';
import '../../../domain/model/complaintagainstaecoveryagent/ComplainAgainstRecoveryAgent.dart';
import '../../../utils/NewTbUrl.dart';
import '../../../values/color/Colors.dart';

Widget complaintHelpAgainstData(
    ComplainAgainstRecoveryAgent complainAgainstRecoveryAgent,
    BuildContext context) {
  List<ComplainAgainstData> list = [];

  if (complainAgainstRecoveryAgent.grievanceOfficer != null &&
      complainAgainstRecoveryAgent.grievanceOfficer!.isNotEmpty) {

    List<HelplineData> ls=[];

    complainAgainstRecoveryAgent.grievanceOfficer?.forEach((element) {
      ls.add(HelplineData(contactPosition: element.contactPosition??"",
          otherDetails: element.otherDetails??"",
          data: HelplineDataURl.mp[element.contactPosition!]!));
    });
    list.add(ComplainAgainstData(title: "Grievance Officer", content: ls));
  }


  if (complainAgainstRecoveryAgent.nodalOfficer != null &&
      complainAgainstRecoveryAgent.nodalOfficer!.isNotEmpty) {

    List<HelplineData> ls=[];

    complainAgainstRecoveryAgent.nodalOfficer?.forEach((element) {
      ls.add(HelplineData(contactPosition: element.contactPosition??"",
          otherDetails: element.otherDetails??"",
          data: HelplineDataURl.mp[element.contactPosition!]!));
    });
    list.add(ComplainAgainstData(title: "Nodal Officer", content: ls));
  }


  if (complainAgainstRecoveryAgent.rBIOmbudsman != null &&
      complainAgainstRecoveryAgent.rBIOmbudsman!.isNotEmpty) {

    List<HelplineData> ls=[];

    complainAgainstRecoveryAgent.rBIOmbudsman?.forEach((element) {
      ls.add(HelplineData(contactPosition: element.contactPosition??"",
          otherDetails: element.otherDetails??"",
          data: HelplineDataURl.mp[element.contactPosition!]!));
    });
    list.add(ComplainAgainstData(title: "RBI Ombudsman", content: ls));
  }
  debugLogs("ITEM RECYCLER ${list.isNotEmpty}");

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, position) {
            var data = list[position];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 20, bottom: 12),
                  child: Text(data.title,
                      style: const TextStyle(
                          fontSize: 22, fontFamily: publicSansBold)),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: data.content.length,
                    itemBuilder: (con, pos) {
                      var content = data.content[pos];
                      debugLogs("${content.data.url} and ${content.data.img}");
                      return InkWell(
                          onTap: () {
                            con.openNewTab(content.data.url);
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
                                    child: Image.network(
                                      content.data.img,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
