import 'dart:convert';

import 'package:butceappflutter/api/models/User.dart';
import 'package:butceappflutter/api/repositories/base_repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class UserRepository extends BaseRepository {
  UserRepository() : super() {
    this.repositoryUri = '${super.baseUri}/User';
  }
  String repositoryUri;

  Future<http.Response> signUp(String email, String name, String password) async {
    String requestUri = '${this.repositoryUri}/Signup';
    Map data = {
      'email': email,
      'name': name,
      'password': password
    };
    //encode Map to JSON
    var body = json.encode(data);
    print(body);
    var response = await http.post(requestUri,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    print("${response.statusCode}");
    print("${response.body}");
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString('key', response.body);
    print(myPrefs.get('key'));
    return response;
  }

  Future<http.Response> logIn(String email, String password) async {
    String requestUri = '${this.repositoryUri}/Login';
    Map data = {
      'email': email,
      'password': password
    };
    var body = json.encode(data);
    print(body);
    var response = await http.post(requestUri,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    print(response.request);
    print(response.body);
    print(response.statusCode);
    if(response.statusCode == 200) {
      myPrefs.setString('key', response.body);
      print(myPrefs.get('key'));
    }
    return response;
  }
  Future<bool> logOut() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.remove('key');
    return true;
  }
}