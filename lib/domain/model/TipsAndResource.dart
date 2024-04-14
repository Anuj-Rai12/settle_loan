import '../../values/res/Resources.dart';

class TipsAndResource {
  String title;
  String desc;
  String src;

  TipsAndResource({
    required this.title,
    required this.src,
    required this.desc,
  });

  static List<TipsAndResource> res = [
    TipsAndResource(
        title: "Do Share And Earn Lot",
        src: walkThroughScreenOne,
        desc:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries."),
    TipsAndResource(
        title: "Do Share And Earn Lot",
        src: walkThroughScreenThree,
        desc:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries."),
    TipsAndResource(
        title: "Do Share And Earn Lot",
        src: walkThroughScreenTwo,
        desc:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries."),
  ];
}
