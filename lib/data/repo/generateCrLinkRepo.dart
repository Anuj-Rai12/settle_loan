

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loansettle/utils/FilesUtils.dart';

class CrLinkGenrator  {


  @override
  Future<String> getCrLink() async {

    //var request = http.Request('GET', Uri.parse('${ApiUrl.baseurl}${ApiUrl.generateCrLinkEndPoint}'));
    
final response = await http.get(Uri.parse('${ApiUrl.baseurl}${ApiUrl.generateCrLinkEndPoint}'));
final data = response.body;
final decodeJsonResponse  =jsonDecode(data);

debugLogs("Status CODE ${response.body}");
    if (response.statusCode == 200) {
      return decodeJsonResponse["CRLink"];
    }
    else {
    throw Exception(response.reasonPhrase);
    }


  }



}
