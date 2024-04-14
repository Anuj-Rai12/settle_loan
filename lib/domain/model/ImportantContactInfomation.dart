class ImportantContactInformation {
  String title;
  String name;
  String phoneNumber;
  String email;
  String src;

  ImportantContactInformation(
      {required this.title,
      required this.email,
      required this.name,
      required this.src,
      required this.phoneNumber});

  static List<ImportantContactInformation> contacts = [
    ImportantContactInformation(
        title: "Your Financial Adviser",
        email: "xyz@gmail.com",
        phoneNumber: "+914321567899",
        src: "assets/images/delete_me.png",
        name: "Anuj Rai"),
    ImportantContactInformation(
        title: "Your Lawyer",
        email: "xyz@gmail.com",
        phoneNumber: "+914321567899",
        src: "assets/images/delete_me.png",
        name: "Rahul")
  ];
}
