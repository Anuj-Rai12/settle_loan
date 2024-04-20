

import 'dart:convert';
import 'package:loansettle/domain/model/contacts/ImportantContactsResponse.dart';
import 'package:loansettle/domain/usecase/ImportantContactsApi.dart';
import 'package:http/http.dart' as http;
import 'package:loansettle/utils/FilesUtils.dart';
class ImportantContactsRepository extends ImportantContactsApi {


  @override
  Future<List<ImportantContacts>> importantContact() async {
    var request = http.Request('GET', Uri.parse('${ApiUrl.baseurl}${ApiUrl.importantContact}'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var value =await response.stream.bytesToString();
      final List<dynamic> jsonDecode = json.decode(value);
      return jsonDecode.map((e) => ImportantContacts.fromJson(e)).toList();
    }
    else {
    throw Exception(response.reasonPhrase);
    }
  }

}