import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:moneytextformfield/src/money_display_format.dart';
import 'package:moneytextformfield/src/money_textformfield_settings.dart';


/// An utility instance
class _Utility {
  /// return Zero with spesific fraction digits length
  static double zeroWithFractionDigits({int fractionDigits = 2}) {
    return double.parse(0.toStringAsFixed(fractionDigits));
  }


  /// Convert string to double with spesific fraction digits length
  static double stringToDouble(String value, {int fractionDigits = 2}) {
    if (value == null || value.isEmpty)
      return zeroWithFractionDigits(fractionDigits: fractionDigits);

    double result;

    try {
      result = double.parse(value);

    } catch (e) {
      result = zeroWithFractionDigits(fractionDigits: fractionDigits);
    }

    return result;
  }


  /// Return formatted type based on [displayFormat]
  static String getFormattedAmount(MoneyDisplayFormat displayFormat, FlutterMoneyFormatter fmf) {
    switch (displayFormat) {
      case MoneyDisplayFormat.compactLeftSymbol: return fmf.compactLeftSymbol; break;
      case MoneyDisplayFormat.compactRightSymbol: return fmf.compactRightSymbol; break;
      case MoneyDisplayFormat.compactNoSymbol: return fmf.compactNonSymbol; break;
      case MoneyDisplayFormat.longLeftSymbol: return fmf.formattedLeftSymbol; break;
      case MoneyDisplayFormat.longRightSymbol: return fmf.formattedRightSymbol; break;
      default: return fmf.formattedNonSymbol; break;
    }
  }
}

/// MoneyTextFormField instance
class MoneyTextFormField extends StatefulWidget {
  /// Constructing instance of MoneyTextFormField
  MoneyTextFormField({@required this.settings}) {
    // make sure there are no null value
    settings
      ..amount = settings.amount ?? _Utility.zeroWithFractionDigits(fractionDigits: settings.fractionDigits)
      ..formattedAmount = '${_Utility.zeroWithFractionDigits(fractionDigits: settings.fractionDigits)}'
      ..controller = settings.controller ?? TextEditingController();
  }


  /// configuration for MoneyTextFormField
  final MoneyTextFormFieldSettings settings;


  @override
  _MoneyTextFormFieldState createState() => _MoneyTextFormFieldState(settings: this.settings);
}


class _MoneyTextFormFieldState extends State<MoneyTextFormField> {
  _MoneyTextFormFieldState({ @required this.settings }) {
    fmf = FlutterMoneyFormatter(amount: settings.amount)
      ..symbol = settings.currencySymbol
      ..fractionDigits = settings.fractionDigits
      ..thousandSeparator = settings.thousandSeparator
      ..decimalSeparator = settings.decimalSeparator
      ..spaceBetweenSymbolAndNumber = settings.spaceBetweenSymbolAndNumber;
  }


  MoneyTextFormFieldSettings settings;
  FlutterMoneyFormatter fmf;


  @override
  void initState() {
    super.initState();

    fmf = fmf.copyWith(amount: settings.amount);
    settings.controller.text = '${settings.amount}';

    settings.controller.addListener(_onChanged);
  }


  @override
  void dispose() {
    super.dispose();

    settings.controller.dispose();
  }


  _onChanged() {
    fmf = fmf.copyWith(amount: _Utility.stringToDouble(settings.controller.text, fractionDigits: settings.fractionDigits));
    settings.formattedAmount = _Utility.getFormattedAmount(settings.displayFormat, fmf);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            controller: settings.controller,
            decoration: InputDecoration(
              labelText: settings.labelText,
              labelStyle: settings.labelStyle 
            ),
            keyboardType: TextInputType.numberWithOptions(
              decimal: true,
              signed: true
            ),
            inputFormatters: [
              WhitelistingTextInputFormatter(RegExp('[0-9.]'))
            ],
            textAlign: TextAlign.right,
            style: settings.inputStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              settings.formattedAmount,
              textAlign: TextAlign.right,
              style: settings.formatStyle
            ),
          )
        ],
      ),
    );
  }
}