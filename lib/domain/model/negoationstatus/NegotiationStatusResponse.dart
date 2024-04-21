

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Bank'] = this.bank;
    data['SettlementIntimation'] = this.settlementIntimation;
    data['RequestServiceNo'] = this.requestServiceNo;
    data['PossibilityofSettlementAcqired'] =
        this.possibilityofSettlementAcqired;
    data['AgreementStatusAmt'] = this.agreementStatusAmt;
    data['CurrentAmountOfferred'] = this.currentAmountOfferred;
    data['Documentation'] = this.documentation;
    return data;
  }
}
