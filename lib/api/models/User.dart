import 'Shared.dart';

class User extends Shared {
  final String name;
  final String mailAdress;
  final String hashedPassword;

  User({this.name, this.mailAdress, this.hashedPassword});
}