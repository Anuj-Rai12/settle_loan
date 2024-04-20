

class ImportantContacts {
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
}
