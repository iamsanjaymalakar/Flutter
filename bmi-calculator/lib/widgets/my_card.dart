import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  MyCard({@required this.color, this.child, this.onTap});

  final Function onTap;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
