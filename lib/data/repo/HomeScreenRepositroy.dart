import 'dart:convert';

import 'package:loansettle/domain/model/home/HomeScreenResponse.dart';
import 'package:loansettle/domain/usecase/HomeScreenApi.dart';
import 'package:http/http.dart' as http;
import 'package:loansettle/utils/FilesUtils.dart';

class HomeScreenRepositroy extends HomeScreenApi {
  @override
  Future<List<HomeScreenResponse>> getHomeScreen(int clientId) async {
    var request = http.Request('GET',
        Uri.parse('${ApiUrl.baseurl}${ApiUrl.homeScreenApiEndPoint}$clientId'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var value = (await response.stream.bytesToString());
      final List<dynamic> jsonDecode = json.decode(value);
      return jsonDecode.map((e) => HomeScreenResponse.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
