import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.deepOrangeAccent,
        padding: EdgeInsets.all(40.0),
        child: Column(
          children: <Widget> [
            Row(
              children: <Widget>[
                Expanded(child: 
                  Text(
                    "Marinara", 
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
                    "Tomato, Garlic", 
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
            ),
            Row(
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
            ),
            PizzaImageWidget()
          ]
        )
      )
    );
  }
}

class PizzaImageWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        image: AssetImage('images/pizza.png'),
        width: 400,
        height: 400
      )
    );
  }

}