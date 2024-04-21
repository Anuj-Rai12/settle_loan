


class ImportantDocument {
  String? documentPath;
  String? title;
  String? description;

  ImportantDocument({this.documentPath, this.title, this.description});

  ImportantDocument.fromJson(Map<String, dynamic> json) {
    documentPath = json['DocumentPath'];
    title = json['Title'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DocumentPath'] = this.documentPath;
    data['Title'] = this.title;
    data['Description'] = this.description;
    return data;
  }
}
