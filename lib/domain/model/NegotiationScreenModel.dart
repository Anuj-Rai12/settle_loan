class NegotiationScreenModel {
  String src;
  String possibilty;
  String statusAggrement;
  String current;
  String bankName;

  NegotiationScreenModel({
    required this.src,
    required this.possibilty,
    required this.statusAggrement,
    required this.bankName,
    required this.current,
  });

  static List<NegotiationScreenModel> ls = [
    NegotiationScreenModel(
        src: "assets/images/bankState.png",
        possibilty: "4000",
        statusAggrement: "3303",
        bankName: "Bank of Board",
        current: "00"),
    NegotiationScreenModel(
        src: "assets/images/bankState.png",
        possibilty: "4000",
        statusAggrement: "3303",
        bankName: "Bank of Board",
        current: "00"),
    NegotiationScreenModel(
        src: "assets/images/bankState.png",
        possibilty: "4000",
        statusAggrement: "3303",
        bankName: "Bank of Board",
        current: "00"),
    NegotiationScreenModel(
        src: "assets/images/bankState.png",
        possibilty: "4000",
        statusAggrement: "3303",
        bankName: "Bank of Board",
        current: "00")
  ];
}
