import 'dart:collection';
import 'dart:convert';

import 'package:butceappflutter/api/models/Expense.dart';
import 'package:butceappflutter/api/repositories/base_repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ExpenseRepository extends BaseRepository {
  String repositoryUri;
  ExpenseRepository() : super() {
    this.repositoryUri = '${super.baseUri}/Expense';
  }
  Future<List<Expense>> get() async {
    String requestUri = '${this.repositoryUri}';
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    var response = await http.get(
      requestUri,
      headers: {
        "Content-Type": "application/json",
        "Key": myPrefs.get('hashedKey')
      },
    );
    var expensesJson = jsonDecode(response.body) as List;
    List<Expense> expenses = expensesJson.map((expenseJson) => Expense.fromJson(expenseJson)).toList();
    return expenses;
  }
  Future<Map> getReportData() async {
    String requestUri = '${this.repositoryUri}/Report/Daily';
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    var response = await http.get(
      requestUri,
      headers: {
        "Content-Type": "application/json",
        "Key": myPrefs.get('hashedKey')
      }
    );
    var expensesJson = jsonDecode(response.body);
    return expensesJson;
  }
  Future<http.Response> post(Expense expense) async {
    String requestUri = '${this.repositoryUri}';
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    var body = json.encode(expense.toMap());
    print(body);
    var response = await http.post(
      requestUri,
      body: body,
      headers: {
        "Content-Type": "application/json",
        "Key": myPrefs.get('hashedKey')
      },
    );
    print(response.statusCode);
    print(response.body);
    return response;
  }
  Future<http.Response> delete(String id) async {
    String requestUri = '${this.repositoryUri}/$id';
    print(requestUri);
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    var response = await http.delete(
      requestUri,
      headers: {
        "Key": myPrefs.get('hashedKey')
      },
    );
    return response;
  }
}