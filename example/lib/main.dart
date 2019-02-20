import 'package:flutter/material.dart';
import 'package:moneytextformfield/moneytextformfield.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController longCtrl = TextEditingController();
  TextEditingController compactCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _ts = TextStyle(fontSize: 26.0);

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('MoneyTextFormField Demo'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => print(longCtrl.text),
            child: Icon(Icons.save),
          ),
          body: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(),
                child: Column(
                  children: <Widget>[
                    MoneyTextFormField(
                      settings: MoneyTextFormFieldSettings(
                          controller: longCtrl,
                          moneyFormatSettings: MoneyFormatSettings(
                              currencySymbol: 'IDR',
                              displayFormat:
                                  MoneyDisplayFormat.longRightSymbol),
                          appearanceSettings: AppearanceSettings(
                              labelText: 'Long Format Demo',
                              hintText: 'Custom Placeholder',
                              labelStyle: _ts,
                              inputStyle: _ts.copyWith(color: Colors.orange),
                              formattedStyle:
                                  _ts.copyWith(color: Colors.blue))),
                    ),
                    MoneyTextFormField(
                      settings: MoneyTextFormFieldSettings(
                          controller: compactCtrl,
                          moneyFormatSettings: MoneyFormatSettings(
                              displayFormat:
                                  MoneyDisplayFormat.compactLeftSymbol),
                          appearanceSettings: AppearanceSettings(
                              labelText: 'Short Format Demo',
                              hintText: 'Custom Placeholder',
                              labelStyle: _ts,
                              inputStyle: _ts.copyWith(color: Colors.orange),
                              formattedStyle:
                                  _ts.copyWith(color: Colors.blue))),
                    ),
                    Divider(
                      color: Colors.black87,
                      height: 24.0,
                    )
                  ],
                )),
          )),
    );
  }
}
