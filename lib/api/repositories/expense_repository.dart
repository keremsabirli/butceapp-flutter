import 'dart:convert';

import 'package:butceappflutter/api/models/Expense.dart';
import 'package:butceappflutter/api/models/User.dart';
import 'package:butceappflutter/api/repositories/base_repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ExpenseRepository extends BaseRepository {
  String repositoryUri;
  ExpenseRepository() : super() {
    this.repositoryUri = '${super.baseUri}/Expense';
  }
  Future<List<Expense>> get() async{
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
  Future<http.Response> post(Expense expense) async {
    String requestUri = '${this.repositoryUri}';
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    var response = await http.post(
      requestUri,
      body: expense,
    );
  }
  Future<bool> delete(String id) async {
  }
}