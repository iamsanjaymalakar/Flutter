import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'chat';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  String email, message;

  @override
  void initState() {
    super.initState();
    getUser();
    //getMessage();
  }

  void getMessage() async {
    try {
      final messages = await _firestore.collection('messages').getDocuments();
      for (var i in messages.documents) {
        print(i.data);
        print(i.data['email']);
        print(i.data['text']);
      }
    } catch (e) {
      print(e);
    }
  }

  void getMessageStream() async {
    try {
      await for (var snapshot
          in _firestore.collection('messages').snapshots()) {
        for (var messages in snapshot.documents) {
          print(messages.data);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void getUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        print(user.email);
        email = user.email;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
//                _auth.signOut();
//                Navigator.pushNamed(context, WelcomeScreen.id);
                getMessageStream();
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      try {
                        await _firestore
                            .collection('messages')
                            .add({'email': email, 'text': message});
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
