import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade600,
          leading: Icon(Icons.arrow_back_ios),
          title: Text('MiCard'),
        ),
        backgroundColor: Colors.blueGrey[900],
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/sanjay.jpg'),
            ),
            Text(
              'Sanjay Malakar',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                  fontSize: 30.0),
            ),
            Text(
              'LEARNING FLUTTER',
              style: TextStyle(
                  color: Colors.lightBlue[200],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 2.7),
            ),
            SizedBox(
              height: 30,
              width: 150,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.lightBlue[200],
                ),
                title: Text(
                  '+8801926491497',
                  style: TextStyle(
                      color: Colors.blueGrey.shade900, fontSize: 17.0),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.lightBlue[200],
                ),
                title: Text(
                  'iamsanjaymalakar@gmail.com',
                  style: TextStyle(
                      color: Colors.blueGrey.shade900, fontSize: 17.0),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
