import 'package:flutter/material.dart';
import './screen/home.dart';

void main() => runApp(HelloFlutterApp());

class HelloFlutterApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello Flutter App",
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Title in App Bar"
            )
          ),
          body: Home()
          )
        );
  }

}
