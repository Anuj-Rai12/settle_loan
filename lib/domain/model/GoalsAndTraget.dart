class GoalsAndTarget {
  String monthlyEmi;
  double progress;
  String dueDate;
  String loanType;

  GoalsAndTarget(
      {required this.dueDate,
      required this.monthlyEmi,
      required this.progress,
      required this.loanType});


  static List<GoalsAndTarget> createGoal(String date, String emi1, String emi2,
      String amount, String loanType1, String loanType2) {
    List<GoalsAndTarget> ls = [];
    ls.add(GoalsAndTarget(
        dueDate: date,
        monthlyEmi: emi1,
        progress: ((int.parse(emi1) / int.parse(amount)) * 100).toInt().toDouble(),
        loanType: loanType1));

    ls.add(GoalsAndTarget(
        dueDate: date,
        monthlyEmi: emi2,
        progress: ((int.parse(emi2) / int.parse(amount)) * 100).toInt().toDouble(),
        loanType: loanType2));
    return ls;
  }
}
