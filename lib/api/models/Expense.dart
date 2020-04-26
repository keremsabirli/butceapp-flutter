class Expense {
  final String name;
  final double amount;
  final String description;
  final String city;
  final DateTime date;
  final int corporateId;
  final int memberId;

  Expense(
      {this.name,
        this.amount,
        this.description,
        this.city,
        this.date,
        this.corporateId,
        this.memberId});
}
