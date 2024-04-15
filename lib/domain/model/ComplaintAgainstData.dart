import 'HelplineData.dart';

class ComplainAgainstData {
  String title;
  List<HelplineData> content;

  ComplainAgainstData({required this.title, required this.content});

  static List<ComplainAgainstData> list = [
    ComplainAgainstData(title: "Grievance Office", content: [
      HelplineData(
          contactPosition: "National Consumer Helpline",
          logo: "assets/images/walk_throught_scree_One.png",
          otherDetails: "Contact Grievance officer for inquiry"),
      HelplineData(
          contactPosition: "Cyber Security",
          logo: "assets/images/walk_throught_screen_three.png",
          otherDetails: "Contact Cyber Security officer for inquiry"),
      HelplineData(
          contactPosition: "Cyber Security",
          logo: "assets/images/walk_throught_screen_two.png",
          otherDetails: "Contact Cyber Security officer for inquiry")
    ]),
    ComplainAgainstData(title: "Nodal Office", content: [
      HelplineData(
          contactPosition: "National Consumer Helpline",
          logo: "assets/images/walk_throught_scree_One.png",
          otherDetails: "Contact Grievance officer for inquiry"),
      HelplineData(
          contactPosition: "Cyber Security",
          logo: "assets/images/walk_throught_screen_three.png",
          otherDetails: "Contact Cyber Security officer for inquiry"),
      HelplineData(
          contactPosition: "Cyber Security",
          logo: "assets/images/walk_throught_screen_two.png",
          otherDetails: "Contact Cyber Security officer for inquiry")
    ]),
    ComplainAgainstData(title: "RBI Ombudsman", content: [
      HelplineData(
          contactPosition: "RBI",
          logo: "assets/images/walk_throught_scree_One.png",
          otherDetails: "Contact RBI for inquiry"),
      HelplineData(
          contactPosition: "Cyber Security",
          logo: "assets/images/walk_throught_screen_three.png",
          otherDetails: "Contact Cyber Security officer for inquiry"),
      HelplineData(
          contactPosition: "Cyber Security",
          logo: "assets/images/walk_throught_screen_two.png",
          otherDetails: "Contact Cyber Security officer for inquiry")
    ]),
  ];
}
