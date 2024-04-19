/// Data : {"Email":"Abhichandra0326@gmail.com","Password":"123","ClientDetails":[{"Clientid":5024,"ClientCode":"CT29875024","ClientName":"ABHISHEK CHANDRA","Mobile":"6200104499","Address":"","City":"Delhi NCR","PinCode":"","Remark":"","PanCard":"AMHPC6545K","DOB":"14 Jun 1990"}],"Result":1,"Message":null}
/// response : "Success"
/// Message : null

/*class LoginResponse {
  LoginResponse({
      Data? data, 
      String? response, 
      dynamic message,}){
    _data = data;
    _response = response;
    _message = message;
}

  LoginResponse.fromJson(dynamic json) {
    _data = null;//json['Data'] != null ? Data.fromJson(json['Data']) : null;
    _response = json['response'];
    _message = json['Message'];
  }
  Data? _data;
  String? _response;
  String? _message;
LoginResponse copyWith({  Data? data,
  String? response,
  String? message,
}) => LoginResponse(  data: data ?? _data,
  response: response ?? _response,
  message: message ?? _message,
);
  Data? get data => _data;
  String? get response => _response;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['Data'] = _data?.toJson();
    }
    map['response'] = _response;
    map['Message'] = _message;
    return map;
  }

}*/

/// Email : "Abhichandra0326@gmail.com"
/// Password : "123"
/// ClientDetails : [{"Clientid":5024,"ClientCode":"CT29875024","ClientName":"ABHISHEK CHANDRA","Mobile":"6200104499","Address":"","City":"Delhi NCR","PinCode":"","Remark":"","PanCard":"AMHPC6545K","DOB":"14 Jun 1990"}]
/// Result : 1
/// Message : null

/*class Data {
  Data({
      String? email, 
      String? password, 
      List<ClientDetails>? clientDetails, 
      int? result, 
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
  int? _result;
  String? _message;
Data copyWith({  String? email,
  String? password,
  List<ClientDetails>? clientDetails,
  int? result,
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
  int? get result => _result;
  String? get message => _message;

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

}*/

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

/*class ClientDetails {
  ClientDetails({
      int? clientid, 
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
  int? _clientid;
  String? _clientCode;
  String? _clientName;
  String? _mobile;
  String? _address;
  String? _city;
  String? _pinCode;
  String? _remark;
  String? _panCard;
  String? _dob;
ClientDetails copyWith({  int? clientid,
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
  int? get clientid => _clientid;
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

}*/


class LoginResponse {
  Data? data;
  String? response;
  String? message;

  LoginResponse({this.data, this.response, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
    response = json['response'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['response'] = response;
    data['Message'] = message;
    return data;
  }
}

class Data {
  String? email;
  String? password;
  List<ClientDetails>? clientDetails;
  int? result;
  String? message;

  Data(
      {this.email,
        this.password,
        this.clientDetails,
        this.result,
        this.message});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['Email'];
    password = json['Password'];
    if (json['ClientDetails'] != null) {
      clientDetails = <ClientDetails>[];
      json['ClientDetails'].forEach((v) {
        clientDetails!.add(new ClientDetails.fromJson(v));
      });
    }
    result = json['Result'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Email'] = this.email;
    data['Password'] = this.password;
    if (this.clientDetails != null) {
      data['ClientDetails'] =
          this.clientDetails!.map((v) => v.toJson()).toList();
    }
    data['Result'] = this.result;
    data['Message'] = this.message;
    return data;
  }
}

class ClientDetails {
  int? clientid;
  String? clientCode;
  String? clientName;
  String? mobile;
  String? address;
  String? city;
  String? pinCode;
  String? remark;
  String? panCard;
  String? dOB;

  ClientDetails(
      {this.clientid,
        this.clientCode,
        this.clientName,
        this.mobile,
        this.address,
        this.city,
        this.pinCode,
        this.remark,
        this.panCard,
        this.dOB});

  ClientDetails.fromJson(Map<String, dynamic> json) {
    clientid = json['Clientid'];
    clientCode = json['ClientCode'];
    clientName = json['ClientName'];
    mobile = json['Mobile'];
    address = json['Address'];
    city = json['City'];
    pinCode = json['PinCode'];
    remark = json['Remark'];
    panCard = json['PanCard'];
    dOB = json['DOB'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Clientid'] = this.clientid;
    data['ClientCode'] = this.clientCode;
    data['ClientName'] = this.clientName;
    data['Mobile'] = this.mobile;
    data['Address'] = this.address;
    data['City'] = this.city;
    data['PinCode'] = this.pinCode;
    data['Remark'] = this.remark;
    data['PanCard'] = this.panCard;
    data['DOB'] = this.dOB;
    return data;
  }
}
