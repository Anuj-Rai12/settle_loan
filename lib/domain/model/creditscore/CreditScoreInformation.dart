class CreditScoreData {
  final String desc;

  CreditScoreData(this.desc);

  static String generateDesc({required int creditScore, required int time}) {
    return "Increasing the score by $creditScore in $time months is difficult. Hence showing the results for increase by 10 in $time months";
  }

  static int howToAchive(double current, double achive){
     if ((achive - current)<=0) {
     return  0;
     } else {
       return (achive - current).toInt();
     }
  }

  static String timeDesc="Number of months\n";
  static String scoreDesc="Score you want to achieve";

  static List<CreditScoreData> generateCreditScoreDataDesc() {
    return [
      CreditScoreData(
          "Close accounts that have not been used for last 6 months"),
      CreditScoreData("Reduce your credit card utilisation from 47% to 25%"),
      CreditScoreData("Your payments on 16 accounts are on time. Keep it up"),
      CreditScoreData(
          "Ensure that the payment history is accurate. If not immediately contact the bank"),
    ];
  }
}
