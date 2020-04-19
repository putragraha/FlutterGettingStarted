import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.deepOrangeAccent,
        margin: EdgeInsets.all(20.0),
        child: Text(
          "Pizza", 
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 80.0,
            decoration: TextDecoration.none,
            fontFamily: 'Amiri',
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic
          ))
    ));
  }
}