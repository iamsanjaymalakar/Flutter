import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile({this.title, this.check, this.onChecked, this.onLongPressed});

  final String title;
  final bool check;
  final Function onChecked;
  final Function onLongPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          decoration: check ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        onChanged: onChecked,
        value: check,
      ),
      onLongPress: onLongPressed,
    );
  }
}
