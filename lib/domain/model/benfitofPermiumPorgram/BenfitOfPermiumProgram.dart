
class BenfitPermiumInstance {
  String? title;
  String? description;

  BenfitPermiumInstance({this.title, this.description});

  BenfitPermiumInstance.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Description'] = this.description;
    return data;
  }
}
