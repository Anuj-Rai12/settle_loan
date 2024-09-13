


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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DocumentPath'] = documentPath;
    data['Title'] = title;
    data['Description'] = description;
    return data;
  }
}
