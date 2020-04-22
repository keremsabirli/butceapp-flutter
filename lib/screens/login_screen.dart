import 'package:butceappflutter/api/repositories/user_repository.dart';
import 'package:butceappflutter/widgets/dialogs.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userRepository = new UserRepository();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Butce App'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                'Login',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email'
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Password'
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                    child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        if(_formKey.currentState.validate()) {
                          Dialogs.showLoadingDialog(context, _keyLoader);
                          this.userRepository.logIn(
                            this.emailController.text,
                            this.passwordController.text,
                          ).then((response) {
                            print(response.body);
                            Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
                            if(response.statusCode == 200) {
                              Navigator.pushReplacementNamed(context, "/homepage");
                            }
                          });
                        }
                      },
                      child: Text(
                        'Submit',
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/signup");
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontStyle: FontStyle.italic
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}