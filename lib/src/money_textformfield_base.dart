import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_money_formatter/flutter_money_formatter.dart';

import 'package:moneytextformfield/src/models/money_display_format.dart';
import 'package:moneytextformfield/src/models/appearance_settings.dart';
import 'package:moneytextformfield/src/models/money_format_settings.dart';
import 'package:moneytextformfield/src/models/money_textformfield_settings.dart';

/// Instance of [MoneyTextFormField] widget
class MoneyTextFormField extends StatefulWidget {
  /// Instance constructor
  MoneyTextFormField({@required this.settings}) {
    settings
      // ..controller = settings.controller ?? TextEditingController()
      ..moneyFormatSettings = settings.moneyFormatSettings ?? MoneyFormatSettings()
      ..moneyFormatSettings.amount = settings.moneyFormatSettings.amount ?? _Utility.zeroWithFractionDigits(fractionDigits: settings.moneyFormatSettings.fractionDigits)
      ..appearanceSettings = settings.appearanceSettings ?? AppearanceSettings();
  }


  /// Configurations data for [MoneyTextFormField] parameter
  final MoneyTextFormFieldSettings settings;


  @override
  _MoneyTextFormFieldState createState() => _MoneyTextFormFieldState();
}


class _MoneyTextFormFieldState extends State<MoneyTextFormField> {
  FlutterMoneyFormatter _fmf = new FlutterMoneyFormatter(amount: 0.0);
  String _formattedAmount;
  bool _useInternalController = false;


  @override
  initState() {
    super.initState();

    MoneyTextFormFieldSettings ws = widget.settings;
    MoneyFormatSettings wsm = ws.moneyFormatSettings;

    // fmf handler
    _fmf = _fmf.copyWith(
      amount: wsm.amount,
      symbol: wsm.currencySymbol,
      fractionDigits: wsm.fractionDigits,
      thousandSeparator: wsm.thousandSeparator,
      decimalSeparator: wsm.decimalSeparator,
      spaceBetweenSymbolAndNumber: wsm.spaceBetweenSymbolAndNumber
    );

    _formattedAmount =_Utility.getFormattedAmount(wsm.displayFormat, _fmf);

    // controller handler
    if (ws.controller == null) {
      ws.controller = TextEditingController();
      _useInternalController = true;
    }

    ws.controller.text = '${_fmf.formattedNonSymbol}';
    ws.controller.addListener(_onChanged);


    // inputFormatter handler
    if (ws.inputFormatters == null)
      ws.inputFormatters = List<TextInputFormatter>();

    ws.inputFormatters.insertAll(0, <TextInputFormatter>[
      WhitelistingTextInputFormatter(RegExp('[0-9.]')),
      BlacklistingTextInputFormatter(RegExp('\s'))
    ]);
  }


  @override
  dispose() {
    super.dispose();

    if (_useInternalController)
      widget.settings.controller.dispose();
  }


  _onChanged() {
    MoneyTextFormFieldSettings ws = widget.settings;
    
    _fmf.amount = _Utility.stringToDouble(
      ws.controller.text, 
      fractionDigits: ws.moneyFormatSettings.fractionDigits
    );

    _formattedAmount = _Utility.getFormattedAmount(ws.moneyFormatSettings.displayFormat, _fmf);

    if (widget.settings.onChanged != null)
      widget.settings.onChanged();
    
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    MoneyTextFormFieldSettings ws = widget.settings;
    AppearanceSettings wsa = ws.appearanceSettings;

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            controller: ws.controller,
            inputFormatters: ws.inputFormatters,
            validator: ws.validator,
            enabled: ws.enabled,
            textAlign: TextAlign.right,
            style: wsa.inputStyle,
            keyboardType: TextInputType.numberWithOptions(
              decimal: true,
              signed: true
            ),
            decoration: InputDecoration(
              icon: wsa.icon,
              labelText: wsa.labelText,
              hintText: wsa.hintText,

              labelStyle: wsa.labelStyle,
              errorStyle: wsa.errorStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              _formattedAmount,
              textAlign: TextAlign.right,
              style: wsa.formattedStyle,
            ),
          )
        ],
      ),
    );
  }
}


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