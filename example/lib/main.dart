import 'package:flutter/material.dart';

import 'package:moneytextformfield/moneytextformfield.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  @override
  void initState() {  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MoneyTextFormField'),
        ),
        body: Column(
          children: <Widget>[
            MoneyTextFormField(
              settings: MoneyTextFormFieldSettings(
                amount: 0.00,
                currencySymbol: '\$',
                decimalSeparator: '.',
                thousandSeparator: ',',
                fractionDigits: 2,
                spaceBetweenSymbolAndNumber: true,
                displayFormat: MoneyDisplayFormat.compactLeftSymbol,

                labelText: 'Amount:',
                labelStyle: TextStyle(fontSize: 26.0),
                inputStyle: TextStyle(fontSize: 26.0),
                formatStyle: TextStyle(fontSize: 26.0, color: Colors.blue)
              )
            ),
          ],
        ),
      ),
    );
  }
}