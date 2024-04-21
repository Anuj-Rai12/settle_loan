

class ItemInfo {
  String url;
  String img;

  ItemInfo({required this.url, required this.img});
}

class HelplineDataURl {
  static Map<String, ItemInfo> mp = {
    "National Consumer Helpline": ItemInfo(
        url: "https://consumerhelpline.gov.in/",
        img: "https://consumerhelpline.gov.in/images/jago1.png"),
    "Cyber Cell": ItemInfo(
        url: "https://cybercrime.gov.in/",
        img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReeJpHqYecxxgdu35kuy8z5tUbEZc6r44JnmsRFAbF-g&s"),
    "RBI": ItemInfo(
        url: "https://rbi.org.in/Scripts/Complaints.aspx",
        img:
        "https://media4support.com/wp-content/uploads/2023/10/RBI-LOGO.jpg")
  };
}
