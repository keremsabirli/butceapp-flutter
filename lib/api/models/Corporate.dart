import 'package:butceappflutter/api/models/Shared.dart';

class Corporate extends Shared {
  final String name;
  final int userId;
  final int corporateTypeId;
  final String iconUrl;

  Corporate({this.name, this.userId, this.corporateTypeId, this.iconUrl});

  factory Corporate.fromJson(Map<String, dynamic> json) {
    return Corporate(
      name: json['name'],
      userId: json['userId'],
      corporateTypeId: json['corporateTypeId'],
      iconUrl: json['iconUrl'],
    );
  }
}
