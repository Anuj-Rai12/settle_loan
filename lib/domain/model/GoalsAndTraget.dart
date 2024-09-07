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


  static List<GoalsAndTarget> createGoal({required  date, required String  emi1, required String  emi2,
      required  amount, required  loanType1, required  loanType2}) {
    List<GoalsAndTarget> ls = [];
    ls.add(GoalsAndTarget(
        dueDate: date,
        monthlyEmi: emi1,
        progress: ((int.parse(emi1.isEmpty == true ? "0":emi1) / int.parse(amount)) * 100).toInt().toDouble(),
        loanType: loanType1));

    ls.add(GoalsAndTarget(
        dueDate: date,
        monthlyEmi: emi2,
        progress: ((int.parse(emi2.isEmpty == true ? "0":emi2) / int.parse(amount)) * 100).toInt().toDouble(),
        loanType: loanType2));
    return ls;
  }
}
