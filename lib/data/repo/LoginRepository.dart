
import 'dart:convert';
import 'package:loansettle/domain/model/login/LoginRequest.dart';
import 'package:loansettle/domain/model/login/LoginResponse.dart';
import 'package:loansettle/domain/usecase/LoginApi.dart';
import 'package:http/http.dart' as http;
import 'package:loansettle/utils/FilesUtils.dart';

class LoginRepository extends LoginApi {

  @override
  Future<LoginResponse> getLogin(LoginRequest loginRequest) async {
    var request =
        http.Request('POST', Uri.parse('${ApiUrl.baseurl}/api/service/VerifyLead'));
    debugLogs(jsonEncode(loginRequest.toJson()));
    request.body = jsonEncode(loginRequest.toJson());
    var headers = {
      'Content-Type': 'application/json'
    };
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    debugLogs("${response.statusCode}");

    //debugLogs(" TESTING -> ${jsonEncode(LoginResponse.fromJson(value))}");
    if (response.statusCode == 200) {
      var value = (await response.stream.bytesToString());
      //debugLogs("${jsonEncode(LoginResponse.fromJson(value))}");
      return LoginResponse.fromJson(json.decode(value));
    } else {
      throw Exception("${response.reasonPhrase}");
    }
  }
}
