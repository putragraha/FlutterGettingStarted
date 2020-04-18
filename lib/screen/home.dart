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
    DateTime currentTime = DateTime.now();
    num currentHour = currentTime.hour;
    num currentMinute = currentTime.minute;
    String greetMessage = "";

    if (currentHour < 12) {
      greetMessage = "Good Morning";
    } else if (currentHour < 18) {
      greetMessage = "Good Afternoon";
    } else {
      greetMessage = "Good Night";
    }

    String hour = currentHour < 10 ? "0" + currentHour.toString() : currentHour.toString();
    String minute = currentMinute < 10 ? "0" + currentMinute.toString() : currentMinute.toString();

    return greetMessage + "\n" + "It's " + hour + ":" + minute;
  }
}