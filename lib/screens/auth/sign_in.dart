import 'package:flutter/material.dart';
import 'package:ninja_brew/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in to Ninja Brew'),
      ),
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: RaisedButton(
          child: Text('Sign in anonymously'),
          onPressed: () async {
            dynamic result = await _auth.anonSignIn();

            if (result != null) {
              print(result);
            } else {
              print('Error signing in.');
            }
          },
        ),
      ),
    );
  }
}
