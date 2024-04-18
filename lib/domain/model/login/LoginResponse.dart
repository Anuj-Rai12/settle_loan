/// Data : {"Email":"Abhichandra0326@gmail.com","Password":"123","ClientDetails":[{"Clientid":5024,"ClientCode":"CT29875024","ClientName":"ABHISHEK CHANDRA","Mobile":"6200104499","Address":"","City":"Delhi NCR","PinCode":"","Remark":"","PanCard":"AMHPC6545K","DOB":"14 Jun 1990"}],"Result":1,"Message":null}
/// response : "Success"
/// Message : null

class LoginResponse {
  LoginResponse({
      Data? data, 
      String? response, 
      dynamic message,}){
    _data = data;
    _response = response;
    _message = message;
}

  LoginResponse.fromJson(dynamic json) {
    _data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
    _response = json['response'];
    _message = json['Message'];
  }
  Data? _data;
  String? _response;
  dynamic _message;
LoginResponse copyWith({  Data? data,
  String? response,
  dynamic message,
}) => LoginResponse(  data: data ?? _data,
  response: response ?? _response,
  message: message ?? _message,
);
  Data? get data => _data;
  String? get response => _response;
  dynamic get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['Data'] = _data?.toJson();
    }
    map['response'] = _response;
    map['Message'] = _message;
    return map;
  }

}

/// Email : "Abhichandra0326@gmail.com"
/// Password : "123"
/// ClientDetails : [{"Clientid":5024,"ClientCode":"CT29875024","ClientName":"ABHISHEK CHANDRA","Mobile":"6200104499","Address":"","City":"Delhi NCR","PinCode":"","Remark":"","PanCard":"AMHPC6545K","DOB":"14 Jun 1990"}]
/// Result : 1
/// Message : null

class Data {
  Data({
      String? email, 
      String? password, 
      List<ClientDetails>? clientDetails, 
      num? result, 
      dynamic message,}){
    _email = email;
    _password = password;
    _clientDetails = clientDetails;
    _result = result;
    _message = message;
}

  Data.fromJson(dynamic json) {
    _email = json['Email'];
    _password = json['Password'];
    if (json['ClientDetails'] != null) {
      _clientDetails = [];
      json['ClientDetails'].forEach((v) {
        _clientDetails?.add(ClientDetails.fromJson(v));
      });
    }
    _result = json['Result'];
    _message = json['Message'];
  }
  String? _email;
  String? _password;
  List<ClientDetails>? _clientDetails;
  num? _result;
  String? _message;
Data copyWith({  String? email,
  String? password,
  List<ClientDetails>? clientDetails,
  num? result,
  dynamic message,
}) => Data(  email: email ?? _email,
  password: password ?? _password,
  clientDetails: clientDetails ?? _clientDetails,
  result: result ?? _result,
  message: message ?? _message,
);
  String? get email => _email;
  String? get password => _password;
  List<ClientDetails>? get clientDetails => _clientDetails;
  num? get result => _result;
  dynamic get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Email'] = _email;
    map['Password'] = _password;
    if (_clientDetails != null) {
      map['ClientDetails'] = _clientDetails?.map((v) => v.toJson()).toList();
    }
    map['Result'] = _result;
    map['Message'] = _message;
    return map;
  }

}

/// Clientid : 5024
/// ClientCode : "CT29875024"
/// ClientName : "ABHISHEK CHANDRA"
/// Mobile : "6200104499"
/// Address : ""
/// City : "Delhi NCR"
/// PinCode : ""
/// Remark : ""
/// PanCard : "AMHPC6545K"
/// DOB : "14 Jun 1990"

class ClientDetails {
  ClientDetails({
      num? clientid, 
      String? clientCode, 
      String? clientName, 
      String? mobile, 
      String? address, 
      String? city, 
      String? pinCode, 
      String? remark, 
      String? panCard, 
      String? dob,}){
    _clientid = clientid;
    _clientCode = clientCode;
    _clientName = clientName;
    _mobile = mobile;
    _address = address;
    _city = city;
    _pinCode = pinCode;
    _remark = remark;
    _panCard = panCard;
    _dob = dob;
}

  ClientDetails.fromJson(dynamic json) {
    _clientid = json['Clientid'];
    _clientCode = json['ClientCode'];
    _clientName = json['ClientName'];
    _mobile = json['Mobile'];
    _address = json['Address'];
    _city = json['City'];
    _pinCode = json['PinCode'];
    _remark = json['Remark'];
    _panCard = json['PanCard'];
    _dob = json['DOB'];
  }
  num? _clientid;
  String? _clientCode;
  String? _clientName;
  String? _mobile;
  String? _address;
  String? _city;
  String? _pinCode;
  String? _remark;
  String? _panCard;
  String? _dob;
ClientDetails copyWith({  num? clientid,
  String? clientCode,
  String? clientName,
  String? mobile,
  String? address,
  String? city,
  String? pinCode,
  String? remark,
  String? panCard,
  String? dob,
}) => ClientDetails(  clientid: clientid ?? _clientid,
  clientCode: clientCode ?? _clientCode,
  clientName: clientName ?? _clientName,
  mobile: mobile ?? _mobile,
  address: address ?? _address,
  city: city ?? _city,
  pinCode: pinCode ?? _pinCode,
  remark: remark ?? _remark,
  panCard: panCard ?? _panCard,
  dob: dob ?? _dob,
);
  num? get clientid => _clientid;
  String? get clientCode => _clientCode;
  String? get clientName => _clientName;
  String? get mobile => _mobile;
  String? get address => _address;
  String? get city => _city;
  String? get pinCode => _pinCode;
  String? get remark => _remark;
  String? get panCard => _panCard;
  String? get dob => _dob;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Clientid'] = _clientid;
    map['ClientCode'] = _clientCode;
    map['ClientName'] = _clientName;
    map['Mobile'] = _mobile;
    map['Address'] = _address;
    map['City'] = _city;
    map['PinCode'] = _pinCode;
    map['Remark'] = _remark;
    map['PanCard'] = _panCard;
    map['DOB'] = _dob;
    return map;
  }

}