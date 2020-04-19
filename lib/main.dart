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

  TextEditingController _distanceController = TextEditingController();

  TextEditingController _avgController = TextEditingController();

  TextEditingController _priceController = TextEditingController();

  final double _formDistance = 5.0;

  final _currencies = ["Dollars", "Euro", "Rupiah"];

  String _selectedCurrency = "Rupiah";

  String _result = "";

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      appBar: AppBar(
        title: Text("Trip Cost Calculator"),
        backgroundColor: Colors.blueAccent
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(_formDistance),
              child: TextField(
                controller: _distanceController,
                decoration: InputDecoration(
                  labelText: "Distance",
                  hintText: "e.g. 124",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
                keyboardType: TextInputType.number
              )
            ),
            Padding(
              padding: EdgeInsets.all(_formDistance),
              child: TextField(
                controller: _avgController,
                decoration: InputDecoration(
                  labelText: "Distance per Unit",
                  hintText: "e.g. 17",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
                keyboardType: TextInputType.number
              )
            ),
            Padding(
              padding: EdgeInsets.all(_formDistance),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _priceController,
                      decoration: InputDecoration(
                        labelText: "Price",
                        hintText: "e.g. 9500",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                        )
                      ),
                      keyboardType: TextInputType.number
                    )
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: _formDistance*5),
                      child: DropdownButton(
                        items: _currencies.map((String value) {
                          return DropdownMenuItem<String> (
                            value: value,
                            child: Text(value)
                          );
                        }).toList(), 
                        value: _selectedCurrency,
                        onChanged: (String value) => _onDropdownChanged(value)
                      )
                    )
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_formDistance),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        "Submit",
                        textScaleFactor: 1.5 ,
                      ),
                      onPressed: () {
                        setState(() => _result =  _getTotalCost());
                      }
                    )
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).buttonColor,
                      textColor: Theme.of(context).primaryColorDark,
                      child: Text(
                        "Reset",
                        textScaleFactor: 1.5 ,
                      ),
                      onPressed: () {
                        setState(() => _reset());
                      }
                    )
                  )
                ]
              )
            ),
            Padding(
              padding: EdgeInsets.all(_formDistance),
              child: Text(_result)
            )
          ]
        ),
      )
    );
  }

  _onDropdownChanged(String value) {
    setState(() {
      _selectedCurrency = value;
    });
  }

  String _getTotalCost() {
    double _distance = double.parse(_distanceController.text);
    double _fuelCost = double.parse(_priceController.text);
    double _consumption = double.parse(_avgController.text);
    double _total = _distance / _consumption * _fuelCost;

    return "Total cost of your trip is " + _total.toStringAsFixed(2) + " " + _selectedCurrency;
  }

  _reset() {
    _distanceController.text = "";
    _avgController.text = "";
    _priceController.text = "";
    setState(() {
      _result = "";
    });
  }
}