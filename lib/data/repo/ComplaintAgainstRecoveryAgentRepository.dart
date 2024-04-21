

import 'dart:convert';

import 'package:loansettle/domain/model/complaintagainstaecoveryagent/ComplainAgainstRecoveryAgent.dart';
import 'package:loansettle/domain/usecase/ComplaintAgainstApi.dart';
import 'package:http/http.dart' as http;
import 'package:loansettle/utils/FilesUtils.dart';

class ComplaintAgainstRecoveryAgentRepository extends ComplaintAgainstApi {


  @override
  Future<ComplainAgainstRecoveryAgent> complaintAgainstApi() async {

    var request = http.Request('GET', Uri.parse('${ApiUrl.baseurl}${ApiUrl.complaintAgainstRecoveryAgent}'));


    http.StreamedResponse response = await request.send();
debugLogs("Status CODE ${response.statusCode}");
    if (response.statusCode == 200) {
      var value=(await response.stream.bytesToString());
      var js=json.decode(value);
      //debugLogs("JSON ${ComplainAgainstRecoveryAgent.fromJson(js)}");
      return ComplainAgainstRecoveryAgent.fromJson(js);
    }
    else {
    throw Exception(response.reasonPhrase);
    }


  }



}
