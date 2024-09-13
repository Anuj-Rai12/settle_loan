

import '../contacts/ImportantContactsResponse.dart';

class HomeScreenResponse {
  List<ClientsDetails> clientsDetails = [];
  List<ImportantContacts>? importantContacts;
  List<TipsResources>? tipsResources;

  HomeScreenResponse(
      {required this.clientsDetails, this.importantContacts, this.tipsResources});

  HomeScreenResponse.fromJson(Map<String, dynamic> json) {
     try{
    if (json['ClientsDetails'] != null) {
       clientsDetails = <ClientsDetails>[];
      json['ClientsDetails'].forEach((v) {
        clientsDetails.add(ClientsDetails.fromJson(v));
      });
    }
     }catch (e) {
      print("Error from client details response: $e ");
     }


       try{
    if (json['ImportantContacts'] != null) {
      importantContacts = <ImportantContacts>[];
      json['ImportantContacts'].forEach((v) {
        importantContacts!.add(ImportantContacts.fromJson(v));
      });
    }
     }catch (e) {
      print("Error from impoartant contact response: $e ");
     }
      


      try{
    if (json['TipsResources'] != null) {
      tipsResources = <TipsResources>[];
      json['TipsResources'].forEach((v) {
        tipsResources!.add(TipsResources.fromJson(v));
      });
    }

      }catch(e){
          print("Error from tips response: $e ");
      }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ClientsDetails'] =
        clientsDetails.map((v) => v.toJson()).toList();
      if (importantContacts != null) {
      data['ImportantContacts'] =
          importantContacts!.map((v) => v.toJson()).toList();
    }
    if (tipsResources != null) {
      data['TipsResources'] =
          tipsResources!.map((v) => v.toJson()).toList();
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
  String? documentUrl;

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
        this.nextEMIdate,
        this.documentUrl
        });

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
    startDate = json['EMIDate'];
    homeLoanEMI = json['HomeLoanEMI'];
    otherExpenses = json['OtherExpenses'];
    nextEMIdate = json['NextEMIdate'];
    documentUrl = json['DocumentURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Clientid'] = clientid;
    data['ClientCode'] = clientCode;
    data['ClientName'] = clientName;
    data['Mobile'] = mobile;
    data['Address'] = address;
    data['City'] = city;
    data['PinCode'] = pinCode;
    data['Remark'] = remark;
    data['PanCard'] = panCard;
    data['DOB'] = dOB;
    data['LoanAmount'] = loanAmount;
    data['LoanSettleAmount'] = loanSettleAmount;
    data['LoanSettleAmount2'] = loanSettleAmount2;
    data['Income'] = income;
    data['EMI'] = eMI;
    data['StartDate'] = startDate;
    data['HomeLoanEMI'] = homeLoanEMI;
    data['OtherExpenses'] = otherExpenses;
    data['NextEMIdate'] = nextEMIdate;
    data['DocumentURL'] = documentUrl;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Imagepath'] = imagepath;
    data['Title'] = title;
    data['Description'] = description;
    return data;
  }
}
