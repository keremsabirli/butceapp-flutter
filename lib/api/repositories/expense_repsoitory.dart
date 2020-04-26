import 'package:butceappflutter/api/repositories/base_repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ExpenseRepository extends BaseRepository {
  String repositoryUri;
  ExpenseRepository() : super() {
    this.repositoryUri = '${super.baseUri}/Expense';
  }
  Future<http.Response> get() async{
    String requestUri = '${this.repositoryUri}/Signup';
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    var response = await http.get(
      requestUri,
      headers: {
        "Content-Type": "application/json",
        "Key": myPrefs.get('key')
      },
    );
    return response;
  }
}