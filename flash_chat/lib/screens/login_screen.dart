import 'package:flutter/material.dart';
import '../widgets/round_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email, password;
  bool _hud;

  @override
  void initState() {
    super.initState();
    _hud = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _hud,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                decoration:
                    inputDecoration.copyWith(hintText: 'Enter your email.'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                textAlign: TextAlign.center,
                obscureText: true,
                decoration:
                    inputDecoration.copyWith(hintText: 'Enter your password.'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundButton(
                label: 'Log In',
                color: Colors.lightBlueAccent,
                onPressed: () async {
                  setState(() {
                    _hud = true;
                  });
                  try {
                    AuthResult res = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (res != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      _hud = false;
                    });
                  } catch (e) {
                    print(e);
                    setState(() {
                      _hud = false;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
