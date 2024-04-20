
class EscalationResponse {
  String? title;
  String? description;
  String? email1;
  String? email2;
  String? otherDetails;

  EscalationResponse(
      {this.title,
        this.description,
        this.email1,
        this.email2,
        this.otherDetails});

  EscalationResponse.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    description = json['Description'];
    email1 = json['Email1'];
    email2 = json['Email2'];
    otherDetails = json['OtherDetails'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = this.title;
    data['Description'] = description;
    data['Email1'] = this.email1;
    data['Email2'] = this.email2;
    data['OtherDetails'] = this.otherDetails;
    return data;
  }
}
