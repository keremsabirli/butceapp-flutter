import 'Shared.dart';

class User extends Shared {
  final String name;
  final String mailAddress;
  final String hashedPassword;

  User({this.name, this.mailAddress, this.hashedPassword});

  factory User.fromJson(dynamic json) {
    return User(
      name: json['name'] as String,
      mailAddress: json['mailAddress'],
      hashedPassword: json['hashedPassword']
    );
  }
}