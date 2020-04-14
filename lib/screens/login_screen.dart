import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
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
                        }
                      },
                      child: Text(
                        'Submit',
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/signup");
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