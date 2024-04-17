import '../../values/res/Resources.dart';

class ImportantDocument {
  String title;
  String image;
  String desc;
  String path;

  ImportantDocument(
      {required this.title, required this.desc, required this.image,this.path="fdklgdfl;g"});

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
