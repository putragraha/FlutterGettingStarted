import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.deepOrangeAccent,
        margin: EdgeInsets.all(20.0),
        child: Text("Pizza", textDirection: TextDirection.ltr)
    ));
  }
}