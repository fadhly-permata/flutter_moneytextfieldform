import 'package:flutter/material.dart';
import 'package:moneytextformfield/moneytextformfield.dart';


void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();


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
          onPressed: () => print(controller.text),
          child: Icon(Icons.save),
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: Column(
              children: <Widget>[
                MoneyTextFormField(
                  settings: MoneyTextFormFieldSettings(
                    controller: controller,
                    appearanceSettings: AppearanceSettings(
                      labelText: 'Custom Label',
                      hintText: 'Custom Placeholder',
                      labelStyle: _ts,
                      inputStyle: _ts.copyWith(color: Colors.orange),
                      formattedStyle: _ts.copyWith(color: Colors.blue)
                    )
                  ),
                )
              ],
            )
          ),
        )
      ),
    );
  }
}