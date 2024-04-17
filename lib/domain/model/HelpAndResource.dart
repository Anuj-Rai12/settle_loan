class HelpAndResource {
  String title;
  String desc;
  bool isExpaned = false;

  HelpAndResource(
      {required this.title, required this.desc, this.isExpaned = false});

  static List<HelpAndResource> ls = [
    HelpAndResource(
        title: "How do I settle my loan?",
        desc:
            "Settling your loan is easy! You can pay using any of the following methods: ACH transfer, Wire transfer, or check. Please allow at least 3-5 business days for your payment to post."),
    HelpAndResource(
        title: "What is the minimum amount for settlement?",
        desc:
            "Settling your loan is easy! You can pay using any of the following methods: ACH transfer, Wire transfer, or check. Please allow at least 3-5 business days for your payment to post."),
    HelpAndResource(
        title: "What is the minimum amount for settlement?",
        desc:
            "Settling your loan is easy! You can pay using any of the following methods: ACH transfer, Wire transfer, or check. Please allow at least 3-5 business days for your payment to post."),
    HelpAndResource(
        title: "What is the minimum amount for settlement?",
        desc:
            "Settling your loan is easy! You can pay using any of the following methods: ACH transfer, Wire transfer, or check. Please allow at least 3-5 business days for your payment to post."),
    HelpAndResource(
        title: "What is the minimum amount for settlement?",
        desc:
            "Settling your loan is easy! You can pay using any of the following methods: ACH transfer, Wire transfer, or check. Please allow at least 3-5 business days for your payment to post."),
  ];
}
