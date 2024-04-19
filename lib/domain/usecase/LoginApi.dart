import 'package:loansettle/domain/model/login/LoginRequest.dart';

import '../model/login/LoginResponse.dart';

abstract class LoginApi {

  Future<LoginResponse> getLogin(LoginRequest loginRequest);

}
