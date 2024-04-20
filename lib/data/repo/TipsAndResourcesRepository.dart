import 'dart:convert';
import 'package:loansettle/domain/model/helpandresource/HelpAndResources.dart';
import 'package:loansettle/domain/usecase/TipsAndResourcesApi.dart';
import 'package:http/http.dart' as http;
import 'package:loansettle/utils/FilesUtils.dart';

class TipsAndResourcesRepository extends TipsAndResourcesApi {


  @override
  Future<HelpAndResources> tipsAndResource() async {
    var request = http.Request('GET',
        Uri.parse('${ApiUrl.baseurl}${ApiUrl.tipsAndResources}'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var value = await response.stream.bytesToString();
      return HelpAndResources.fromJson(json.decode(value));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }



}
