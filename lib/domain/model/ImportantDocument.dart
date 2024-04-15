import '../../values/res/Resources.dart';

class ImportantDocument {
  String title;
  String image;
  String desc;

  ImportantDocument(
      {required this.title, required this.desc, required this.image});

  static List<ImportantDocument> list = [
    ImportantDocument(
        title: "Intimation Letter",
        desc:
            "Some text explaining the letter to the User will have to be written and shown here",
        image: document1),
    ImportantDocument(
        title: "Preferred Location",
        desc:
            "Some text explaining the letter to the User will have to be written and shown here",
        image: document2),
  ];
}
