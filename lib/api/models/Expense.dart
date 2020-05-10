import 'Shared.dart';

class Expense extends Shared {
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
        
  factory Expense.fromJson(dynamic json) {
    return Expense(
      name: json['name'],
      amount: json['userId'],
      description: json['corporateTypeId'],
      city: json['iconUrl'],
      corporateId: json['corporateId'],
      memberId: json['memberId']
    );
  }
}
