import 'dart:convert';

import 'package:loansettle/domain/model/negoationstatus/NegotiationStatusResponse.dart';
import 'package:loansettle/domain/usecase/NegotiationScreenApi.dart';
import 'package:http/http.dart' as http;
import 'package:loansettle/utils/FilesUtils.dart';

class NegotiationStatusRepository extends NegotiationScreenApi {
  @override
  Future<List<NegotiationStatus>> getNegotiationStatus(int clientId) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            "${ApiUrl.baseurl}${ApiUrl.negotiationStatusResponse}$clientId"));

    http.StreamedResponse response = await request.send();
    debugLogs("Status ${response.statusCode}");
    if (response.statusCode == 200) {
      var value = (await response.stream.bytesToString());
      final List<dynamic> jsonDecode = json.decode(value);
      debugLogs("${jsonDecode}");
      return jsonDecode.map((e) => NegotiationStatus.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
