import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Expanded getChild(Color col, int num) {
    return Expanded(
      child: FlatButton(
        color: col,
        onPressed: () {
          final player = AudioCache();
          player.play('note$num.wav');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                getChild(Colors.red, 1),
                getChild(Colors.orange, 2),
                getChild(Colors.yellow, 3),
                getChild(Colors.green, 4),
                getChild(Colors.blue, 5),
                getChild(Colors.indigo, 6),
                getChild(Colors.purple, 7),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
