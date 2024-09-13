

class ImportantContacts {
  int? clientid;
  String? clientCode;
  String? clientName;
  String? clientMobile;
  String? clientEmail;
  String? financialAdvisorName;
  String? financialAdvisorMobileNo;
  String? financialAdvisorEmail;
  String? legalAdvisorName;
  String? legalAdvisorMobileNo;
  String? legalAdvisorEmail;
  String? legalAdvisorImagepath;

  ImportantContacts(
      {this.clientid,
      this.clientCode,
      this.clientName,
      this.clientMobile,
      this.clientEmail,
      this.financialAdvisorName,
      this.financialAdvisorMobileNo,
      this.financialAdvisorEmail,
      this.legalAdvisorName,
      this.legalAdvisorMobileNo,
      this.legalAdvisorEmail,
      this.legalAdvisorImagepath});

  ImportantContacts.fromJson(Map<String, dynamic> json) {
    clientid = json['Clientid'];
    clientCode = json['ClientCode'];
    clientName = json['ClientName'];
    clientMobile = json['ClientMobile'];
    clientEmail = json['ClientEmail'];
    financialAdvisorName = json['FinancialAdvisorName'];
    financialAdvisorMobileNo = json['FinancialAdvisorMobileNo'];
    financialAdvisorEmail = json['FinancialAdvisorEmail'];
    legalAdvisorName = json['LegalAdvisorName'];
    legalAdvisorMobileNo = json['LegalAdvisorMobileNo'];
    legalAdvisorEmail = json['LegalAdvisorEmail'];
    legalAdvisorImagepath = json['LegalAdvisorImagepath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Clientid'] = clientid;
    data['ClientCode'] = clientCode;
    data['ClientName'] = clientName;
    data['ClientMobile'] = clientMobile;
    data['ClientEmail'] = clientEmail;
    data['FinancialAdvisorName'] = financialAdvisorName;
    data['FinancialAdvisorMobileNo'] = financialAdvisorMobileNo;
    data['FinancialAdvisorEmail'] = financialAdvisorEmail;
    data['LegalAdvisorName'] = legalAdvisorName;
    data['LegalAdvisorMobileNo'] = legalAdvisorMobileNo;
    data['LegalAdvisorEmail'] = legalAdvisorEmail;
    data['LegalAdvisorImagepath'] = legalAdvisorImagepath;
    return data;
  }
}

/*class ImportantContacts {
  String? imagepath;
  String? position;
  String? name;
  String? email;
  String? mobileNo;

  ImportantContacts(
      {this.imagepath, this.position, this.name, this.email, this.mobileNo});

  ImportantContacts.fromJson(Map<String, dynamic> json) {
    imagepath = json['Imagepath'];
    position = json['Position'];
    name = json['Name'];
    email = json['Email'];
    mobileNo = json['MobileNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Imagepath'] = this.imagepath;
    data['Position'] = this.position;
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['MobileNo'] = this.mobileNo;
    return data;
  }
}*/
