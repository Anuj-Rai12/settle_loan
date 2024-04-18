/// Email : "Abhichandra0326@gmail.com"
/// Password : "123"

class LoginRequest {
  LoginRequest({
      String? email, 
      String? password,}){
    _email = email;
    _password = password;
}

  LoginRequest.fromJson(dynamic json) {
    _email = json['Email'];
    _password = json['Password'];
  }
  String? _email;
  String? _password;
LoginRequest copyWith({  String? email,
  String? password,
}) => LoginRequest(  email: email ?? _email,
  password: password ?? _password,
);
  String? get email => _email;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Email'] = _email;
    map['Password'] = _password;
    return map;
  }

}