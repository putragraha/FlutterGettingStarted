import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestures & Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Gestures & Animations'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int numTaps = 0;

  int numDoubleTaps = 0;

  int numLongPresses = 0;

  double posX = 0.0;

  double posY = 0.0;

  double boxSize = 150.0;

  @override
  Widget build(BuildContext context) {
    if (posX == 0) {
      center(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).primaryColorLight,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            "Taps: $numTaps - Double Taps: $numDoubleTaps - Long Presses: $numLongPresses",
            style: Theme.of(context).textTheme.title
          )
        )
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            numTaps++;
          });
        },
        onDoubleTap: () {
          setState(() {
            numDoubleTaps++;
          });
        },
        onLongPress: () {
          setState(() {
            numLongPresses++;
          });
        },
        onVerticalDragUpdate: (DragUpdateDetails value) {
          setState(() {
            posY += value.delta.dy;
          });
        },
        onHorizontalDragUpdate: (DragUpdateDetails value) {
          setState(() {
            posX += value.delta.dx;
          });
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              left: posX,
              top: posY,
              child: Container(
                width: boxSize,
                height: boxSize,
                decoration: BoxDecoration(
                  color: Colors.red
                )
              )
            )
          ]
        )
      )
    );
  }

  void center(BuildContext context) {
    posX = (MediaQuery.of(context).size.width / 2) - boxSize / 2;
    posY = (MediaQuery.of(context).size.height / 2) - boxSize / 2 - 30.0;

    setState(() {
      posX = posX;
      posY = posY;
    });
  }
}
