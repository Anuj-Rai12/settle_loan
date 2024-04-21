

import '../contacts/ImportantContactsResponse.dart';

class HomeScreenResponse {
  List<ClientsDetails>? clientsDetails;
  List<ImportantContacts>? importantContacts;
  List<TipsResources>? tipsResources;

  HomeScreenResponse(
      {this.clientsDetails, this.importantContacts, this.tipsResources});

  HomeScreenResponse.fromJson(Map<String, dynamic> json) {
    if (json['ClientsDetails'] != null) {
      clientsDetails = <ClientsDetails>[];
      json['ClientsDetails'].forEach((v) {
        clientsDetails!.add(ClientsDetails.fromJson(v));
      });
    }
    if (json['ImportantContacts'] != null) {
      importantContacts = <ImportantContacts>[];
      json['ImportantContacts'].forEach((v) {
        importantContacts!.add(ImportantContacts.fromJson(v));
      });
    }
    if (json['TipsResources'] != null) {
      tipsResources = <TipsResources>[];
      json['TipsResources'].forEach((v) {
        tipsResources!.add(new TipsResources.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clientsDetails != null) {
      data['ClientsDetails'] =
          this.clientsDetails!.map((v) => v.toJson()).toList();
    }
    if (this.importantContacts != null) {
      data['ImportantContacts'] =
          this.importantContacts!.map((v) => v.toJson()).toList();
    }
    if (this.tipsResources != null) {
      data['TipsResources'] =
          this.tipsResources!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClientsDetails {
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
  String? loanAmount;
  String? loanSettleAmount;
  String? loanSettleAmount2;
  String? income;
  String? eMI;
  String? startDate;
  String? homeLoanEMI;
  String? otherExpenses;
  String? nextEMIdate;

  ClientsDetails(
      {this.clientid,
        this.clientCode,
        this.clientName,
        this.mobile,
        this.address,
        this.city,
        this.pinCode,
        this.remark,
        this.panCard,
        this.dOB,
        this.loanAmount,
        this.loanSettleAmount,
        this.loanSettleAmount2,
        this.income,
        this.eMI,
        this.startDate,
        this.homeLoanEMI,
        this.otherExpenses,
        this.nextEMIdate});

  ClientsDetails.fromJson(Map<String, dynamic> json) {
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
    loanAmount = json['LoanAmount'];
    loanSettleAmount = json['LoanSettleAmount'];
    loanSettleAmount2 = json['LoanSettleAmount2'];
    income = json['Income'];
    eMI = json['EMI'];
    startDate = json['StartDate'];
    homeLoanEMI = json['HomeLoanEMI'];
    otherExpenses = json['OtherExpenses'];
    nextEMIdate = json['NextEMIdate'];
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
    data['LoanAmount'] = this.loanAmount;
    data['LoanSettleAmount'] = this.loanSettleAmount;
    data['LoanSettleAmount2'] = this.loanSettleAmount2;
    data['Income'] = this.income;
    data['EMI'] = this.eMI;
    data['StartDate'] = this.startDate;
    data['HomeLoanEMI'] = this.homeLoanEMI;
    data['OtherExpenses'] = this.otherExpenses;
    data['NextEMIdate'] = this.nextEMIdate;
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

class TipsResources {
  String? imagepath;
  String? title;
  String? description;

  TipsResources({this.imagepath, this.title, this.description});

  TipsResources.fromJson(Map<String, dynamic> json) {
    imagepath = json['Imagepath'];
    title = json['Title'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Imagepath'] = this.imagepath;
    data['Title'] = this.title;
    data['Description'] = this.description;
    return data;
  }
}
