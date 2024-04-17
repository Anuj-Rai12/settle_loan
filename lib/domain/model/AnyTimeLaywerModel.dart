class AnyTimeLawyerModel {
  String title;
  String desc;

  AnyTimeLawyerModel({
    required this.desc,
    required this.title
  });

  static List<AnyTimeLawyerModel> ls=[
    AnyTimeLawyerModel(desc: "Unlimited access to our team of lawyers", title: "Legal Advice"),
    AnyTimeLawyerModel(desc: "Help preparing your will", title: "Estate planning"),
    AnyTimeLawyerModel(desc: "Assistance in case of ID theft", title: "Identity protection"),
    AnyTimeLawyerModel(desc: "Our team can help with any legal issue", title: "Family law"),
  ];
}