import 'dart:ui';
import 'package:flutter/material.dart';

void main() => runApp(FlutterApp());

class FlutterApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Trip Cost Calculator",
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: FuelForm()
    );
  }
}

class FuelForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _FuelFormState();
}

/// Underscore (_) ymbol here means this class access is "private"
class _FuelFormState extends State<FuelForm> {

  String name = "";

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

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
                labelText: "Distance",
                hintText: "e.g. 124",
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
              keyboardType: TextInputType.number,
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