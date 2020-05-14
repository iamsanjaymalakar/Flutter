import 'package:flutter/foundation.dart';

class Task {
  String title;
  bool check;

  Task({@required this.title, this.check = false});

  void toggle() {
    check = !check;
  }
}
