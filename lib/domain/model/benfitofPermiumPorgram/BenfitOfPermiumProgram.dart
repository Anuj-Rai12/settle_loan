
class BenfitPermiumInstance {
  String? title;
  String? description;

  BenfitPermiumInstance({this.title, this.description});

  BenfitPermiumInstance.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = title;
    data['Description'] = description;
    return data;
  }
}
