import 'dart:convert';

import 'package:loansettle/domain/model/benfitofPermiumPorgram/BenfitOfPermiumProgram.dart';
import 'package:loansettle/domain/usecase/BenfitOfPremiumApi.dart';
import 'package:http/http.dart' as http;
import 'package:loansettle/utils/FilesUtils.dart';

class BenfitOfPremoumRepository extends BenfitOfPremiumApi {
  @override
  Future<List<BenfitPermiumInstance>> getPremium() async {
    var request = http.Request(
        'GET', Uri.parse('${ApiUrl.baseurl}${ApiUrl.benfitOfEndPoint}'));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var value = (await response.stream.bytesToString());
      final List<dynamic> jsonDecode = json.decode(value);
      return jsonDecode.map((e) => BenfitPermiumInstance.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
