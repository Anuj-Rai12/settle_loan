import 'dart:convert';

import 'package:loansettle/domain/model/escalation/EscalationResponse.dart';
import '../../domain/usecase/EscalationApi.dart';
import 'package:http/http.dart' as http;

import '../../utils/FilesUtils.dart';

class EscalationRepository extends EscalationApi {
  @override
  Future<List<EscalationResponse>> getEscalationRequest() async {
    var request = http.Request(
        'GET', Uri.parse('${ApiUrl.baseurl}${ApiUrl.escalationEndPoint}'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var value = await response.stream.bytesToString();
      final List<dynamic> jsonDecode = json.decode(value);
      return jsonDecode.map((e) => EscalationResponse.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
