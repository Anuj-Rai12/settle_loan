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

  static List<GoalsAndTarget> list = [
    GoalsAndTarget(
        dueDate: "21-11-2021",
        monthlyEmi: "543K",
        progress: 0.60,
        loanType: "Monthly EMI Due:"),
    GoalsAndTarget(
        dueDate: "11-11-2021",
        monthlyEmi: "543K",
        progress: 0.20,
        loanType: "Monthly Car Loan Due:")
  ];
}
