import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.deepOrangeAccent,
        margin: EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            Expanded(child: 
              Text(
                "Margherita", 
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 30.0,
                  decoration: TextDecoration.none,
                  fontFamily: 'Amiri',
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
                )
              )
            ),
            Expanded(child: 
              Text(
                "Tomato, Mozarella, Basil", 
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 20.0,
                  decoration: TextDecoration.none,
                  fontFamily: 'Amiri',
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic
                )
              )
            )
          ]
        )
      )
    );
  }
}