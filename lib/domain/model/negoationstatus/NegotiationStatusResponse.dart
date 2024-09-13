

class NegotiationStatus {
  String? bank;
  String? settlementIntimation;
  String? requestServiceNo;
  String? possibilityofSettlementAcqired;
  String? agreementStatusAmt;
  String? currentAmountOfferred;
  String? documentation;

  NegotiationStatus(
      {this.bank,
        this.settlementIntimation,
        this.requestServiceNo,
        this.possibilityofSettlementAcqired,
        this.agreementStatusAmt,
        this.currentAmountOfferred,
        this.documentation});

  NegotiationStatus.fromJson(Map<String, dynamic> json) {
    bank = json['Bank'];
    settlementIntimation = json['SettlementIntimation'];
    requestServiceNo = json['RequestServiceNo'];
    possibilityofSettlementAcqired = json['PossibilityofSettlementAcqired'];
    agreementStatusAmt = json['AgreementStatusAmt'];
    currentAmountOfferred = json['CurrentAmountOfferred'];
    documentation = json['Documentation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Bank'] = bank;
    data['SettlementIntimation'] = settlementIntimation;
    data['RequestServiceNo'] = requestServiceNo;
    data['PossibilityofSettlementAcqired'] =
        possibilityofSettlementAcqired;
    data['AgreementStatusAmt'] = agreementStatusAmt;
    data['CurrentAmountOfferred'] = currentAmountOfferred;
    data['Documentation'] = documentation;
    return data;
  }
}
