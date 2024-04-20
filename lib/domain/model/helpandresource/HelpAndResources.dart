

class HelpAndResources {
  String? heading;
  String? description;
  List<TipsData>? data;

  HelpAndResources({this.heading, this.description, this.data});

  HelpAndResources.fromJson(Map<String, dynamic> json) {
    heading = json['Heading'];
    description = json['Description'];
    if (json['Data'] != null) {
      data = <TipsData>[];
      json['Data'].forEach((v) {
        data!.add(TipsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Heading'] = heading;
    data['Description'] = description;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TipsData {
  String? question;
  String? answer;

  TipsData({this.question, this.answer});

  TipsData.fromJson(Map<String, dynamic> json) {
    question = json['Question'];
    answer = json['Answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Question'] = this.question;
    data['Answer'] = this.answer;
    return data;
  }
}
