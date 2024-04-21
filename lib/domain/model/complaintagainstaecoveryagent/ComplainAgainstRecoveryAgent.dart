import 'package:loansettle/utils/FilesUtils.dart';

/// Grievance Officer : [{"ContactPosition":"National Consumer Helpline","Description":"NA","ContactNo":"9547854128","PhoneNo":"8886554444","Email":"contactgrievance@gamil.com","OtherDetails":"Contact Grievance officer for inquiry"},{"ContactPosition":"Cyber Cell","Description":"NA","ContactNo":"3820758975","PhoneNo":"9067731735","Email":"Cyber Cell@gmail.com","OtherDetails":"Contact Cyber Cell for inquiry"}]
/// Nodal Officer : [{"ContactPosition":"National Consumer Helpline","Description":"NA","ContactNo":"8303872655","PhoneNo":"9695376536","Email":"consumer@gmail.com","OtherDetails":"Contact National Consumer Helpline for inquiry"}]
/// RBI Ombudsman : [{"ContactPosition":"RBI","Description":"NA","ContactNo":"7898969728","PhoneNo":"5379460803","Email":"rbi@gmail.com","OtherDetails":"Contact RBI for inquiry"}]

class ComplainAgainstRecoveryAgent {
  ComplainAgainstRecoveryAgent({
      List<GrievanceOfficer>? grievanceOfficer, 
      List<NodalOfficer>? nodalOfficer, 
      List<RbiOmbudsman>? rBIOmbudsman,}){
    _grievanceOfficer = grievanceOfficer;
    _nodalOfficer = nodalOfficer;
    _rBIOmbudsman = rBIOmbudsman;
}

  ComplainAgainstRecoveryAgent.fromJson(dynamic json) {
    //debugLogs("Add grive 1  ${json}");
    if (json['Grievance Officer'] != null) {
      _grievanceOfficer = [];
     // debugLogs("Add grive");
      json['Grievance Officer'].forEach((v) {
        debugLogs("ADD GRIEVANCE");
        _grievanceOfficer?.add(GrievanceOfficer.fromJson(v));
      });
    }
    if (json['Nodal Officer'] != null) {
      _nodalOfficer = [];
      json['Nodal Officer'].forEach((v) {
        _nodalOfficer?.add(NodalOfficer.fromJson(v));
      });
    }
    if (json['RBI Ombudsman'] != null) {
      _rBIOmbudsman = [];
      json['RBI Ombudsman'].forEach((v) {
        debugLogs("ADD RBI");
        _rBIOmbudsman?.add(RbiOmbudsman.fromJson(v));
      });
    }
  }
  List<GrievanceOfficer>? _grievanceOfficer;
  List<NodalOfficer>? _nodalOfficer;
  List<RbiOmbudsman>? _rBIOmbudsman;
ComplainAgainstRecoveryAgent copyWith({  List<GrievanceOfficer>? grievanceOfficer,
  List<NodalOfficer>? nodalOfficer,
  List<RbiOmbudsman>? rBIOmbudsman,
}) => ComplainAgainstRecoveryAgent(  grievanceOfficer: grievanceOfficer ?? _grievanceOfficer,
  nodalOfficer: nodalOfficer ?? _nodalOfficer,
  rBIOmbudsman: rBIOmbudsman ?? _rBIOmbudsman,
);
  List<GrievanceOfficer>? get grievanceOfficer => _grievanceOfficer;
  List<NodalOfficer>? get nodalOfficer => _nodalOfficer;
  List<RbiOmbudsman>? get rBIOmbudsman => _rBIOmbudsman;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_grievanceOfficer != null) {
      map['Grievance Officer'] = _grievanceOfficer?.map((v) => v.toJson()).toList();
    }
    if (_nodalOfficer != null) {
      map['Nodal Officer'] = _nodalOfficer?.map((v) => v.toJson()).toList();
    }
    if (_rBIOmbudsman != null) {
      map['RBI Ombudsman'] = _rBIOmbudsman?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// ContactPosition : "RBI"
/// Description : "NA"
/// ContactNo : "7898969728"
/// PhoneNo : "5379460803"
/// Email : "rbi@gmail.com"
/// OtherDetails : "Contact RBI for inquiry"

class RbiOmbudsman {
  RbiOmbudsman({
      String? contactPosition, 
      String? description, 
      String? contactNo, 
      String? phoneNo, 
      String? email, 
      String? otherDetails,}){
    _contactPosition = contactPosition;
    _description = description;
    _contactNo = contactNo;
    _phoneNo = phoneNo;
    _email = email;
    _otherDetails = otherDetails;
}

  RbiOmbudsman.fromJson(dynamic json) {
    _contactPosition = json['ContactPosition'];
    _description = json['Description'];
    _contactNo = json['ContactNo'];
    _phoneNo = json['PhoneNo'];
    _email = json['Email'];
    _otherDetails = json['OtherDetails'];
  }
  String? _contactPosition;
  String? _description;
  String? _contactNo;
  String? _phoneNo;
  String? _email;
  String? _otherDetails;
RbiOmbudsman copyWith({  String? contactPosition,
  String? description,
  String? contactNo,
  String? phoneNo,
  String? email,
  String? otherDetails,
}) => RbiOmbudsman(  contactPosition: contactPosition ?? _contactPosition,
  description: description ?? _description,
  contactNo: contactNo ?? _contactNo,
  phoneNo: phoneNo ?? _phoneNo,
  email: email ?? _email,
  otherDetails: otherDetails ?? _otherDetails,
);
  String? get contactPosition => _contactPosition;
  String? get description => _description;
  String? get contactNo => _contactNo;
  String? get phoneNo => _phoneNo;
  String? get email => _email;
  String? get otherDetails => _otherDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ContactPosition'] = _contactPosition;
    map['Description'] = _description;
    map['ContactNo'] = _contactNo;
    map['PhoneNo'] = _phoneNo;
    map['Email'] = _email;
    map['OtherDetails'] = _otherDetails;
    return map;
  }

}

/// ContactPosition : "National Consumer Helpline"
/// Description : "NA"
/// ContactNo : "8303872655"
/// PhoneNo : "9695376536"
/// Email : "consumer@gmail.com"
/// OtherDetails : "Contact National Consumer Helpline for inquiry"

class NodalOfficer {
  NodalOfficer({
      String? contactPosition, 
      String? description, 
      String? contactNo, 
      String? phoneNo, 
      String? email, 
      String? otherDetails,}){
    _contactPosition = contactPosition;
    _description = description;
    _contactNo = contactNo;
    _phoneNo = phoneNo;
    _email = email;
    _otherDetails = otherDetails;
}

  NodalOfficer.fromJson(dynamic json) {
    _contactPosition = json['ContactPosition'];
    _description = json['Description'];
    _contactNo = json['ContactNo'];
    _phoneNo = json['PhoneNo'];
    _email = json['Email'];
    _otherDetails = json['OtherDetails'];
  }
  String? _contactPosition;
  String? _description;
  String? _contactNo;
  String? _phoneNo;
  String? _email;
  String? _otherDetails;
NodalOfficer copyWith({  String? contactPosition,
  String? description,
  String? contactNo,
  String? phoneNo,
  String? email,
  String? otherDetails,
}) => NodalOfficer(  contactPosition: contactPosition ?? _contactPosition,
  description: description ?? _description,
  contactNo: contactNo ?? _contactNo,
  phoneNo: phoneNo ?? _phoneNo,
  email: email ?? _email,
  otherDetails: otherDetails ?? _otherDetails,
);
  String? get contactPosition => _contactPosition;
  String? get description => _description;
  String? get contactNo => _contactNo;
  String? get phoneNo => _phoneNo;
  String? get email => _email;
  String? get otherDetails => _otherDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ContactPosition'] = _contactPosition;
    map['Description'] = _description;
    map['ContactNo'] = _contactNo;
    map['PhoneNo'] = _phoneNo;
    map['Email'] = _email;
    map['OtherDetails'] = _otherDetails;
    return map;
  }

}

/// ContactPosition : "National Consumer Helpline"
/// Description : "NA"
/// ContactNo : "9547854128"
/// PhoneNo : "8886554444"
/// Email : "contactgrievance@gamil.com"
/// OtherDetails : "Contact Grievance officer for inquiry"

class GrievanceOfficer {
  GrievanceOfficer({
      String? contactPosition, 
      String? description, 
      String? contactNo, 
      String? phoneNo, 
      String? email, 
      String? otherDetails,}){
    _contactPosition = contactPosition;
    _description = description;
    _contactNo = contactNo;
    _phoneNo = phoneNo;
    _email = email;
    _otherDetails = otherDetails;
}

  GrievanceOfficer.fromJson(dynamic json) {
    _contactPosition = json['ContactPosition'];
    _description = json['Description'];
    _contactNo = json['ContactNo'];
    _phoneNo = json['PhoneNo'];
    _email = json['Email'];
    _otherDetails = json['OtherDetails'];
  }
  String? _contactPosition;
  String? _description;
  String? _contactNo;
  String? _phoneNo;
  String? _email;
  String? _otherDetails;
GrievanceOfficer copyWith({  String? contactPosition,
  String? description,
  String? contactNo,
  String? phoneNo,
  String? email,
  String? otherDetails,
}) => GrievanceOfficer(  contactPosition: contactPosition ?? _contactPosition,
  description: description ?? _description,
  contactNo: contactNo ?? _contactNo,
  phoneNo: phoneNo ?? _phoneNo,
  email: email ?? _email,
  otherDetails: otherDetails ?? _otherDetails,
);
  String? get contactPosition => _contactPosition;
  String? get description => _description;
  String? get contactNo => _contactNo;
  String? get phoneNo => _phoneNo;
  String? get email => _email;
  String? get otherDetails => _otherDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ContactPosition'] = _contactPosition;
    map['Description'] = _description;
    map['ContactNo'] = _contactNo;
    map['PhoneNo'] = _phoneNo;
    map['Email'] = _email;
    map['OtherDetails'] = _otherDetails;
    return map;
  }

}