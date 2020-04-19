import 'package:flutter/material.dart';

void main() => runApp(HelloApp());

class HelloApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello App",
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: HelloStateWidget()
    );
  }
}

class HelloStateWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HelloState();
}

/// Underscore (_) ymbol here means this class access is "private"
class _HelloState extends State<HelloStateWidget> {

  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello App"),
        backgroundColor: Colors.blueAccent
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "Please input your name"
              ),
              onChanged: (String string) {
                setState(() => name = string);
              }
            ),
            Text("Hello " + name + "!")
          ]
        ),
      )
    );
  }
}