import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
              color: Colors.deepPurple,
              child: Center(
                  child: Text(
                    getGreetMessage(),
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 36.0
                    )
                  )
              )
            );
  }

  String getGreetMessage() {
    num currentHour = DateTime.now().hour;

    if (currentHour < 12) {
      return "Good Morning";
    } else if (currentHour < 18) {
      return "Good Afternoon";
    } else {
      return "Good Night";
    }
  }
}