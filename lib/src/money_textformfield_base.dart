/// Copyright (c) 2019, Fadhly Permata (<fadhly.permata@gmail.com>)
/// All rights reserved.
///
/// Redistribution and use in source and binary forms, with or without
/// modification, are permitted provided that the following conditions are met:
///
/// 1. Redistributions of source code must retain the above copyright notice, this
///    list of conditions and the following disclaimer.
/// 2. Redistributions in binary form must reproduce the above copyright notice,
///    this list of conditions and the following disclaimer in the documentation
///    and/or other materials provided with the distribution.
///
/// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
/// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
/// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
/// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
/// ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
/// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
/// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
/// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
/// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
/// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
///
/// The views and conclusions contained in the software and documentation are those
/// of the authors and should not be interpreted as representing official policies,
/// either expressed or implied, of the MoneyTextFieldForm project.
///
///
/// ---
///
/// | Author  | Fadhly Permata |
/// | ------- | -------------- |
/// | Email   | fadhly.permata@gmail.com |
/// | GitHub  | https://github.com/fadhly-permata/flutter_moneytextfieldform |
/// | Pub     | https://pub.dartlang.org/packages/moneytextformfield |
///
/// ---

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
      ..moneyFormatSettings =
          settings.moneyFormatSettings ?? MoneyFormatSettings()
      ..moneyFormatSettings.amount = settings.moneyFormatSettings.amount ??
          _Utility.zeroWithFractionDigits(
              fractionDigits: settings.moneyFormatSettings.fractionDigits)
      ..appearanceSettings =
          settings.appearanceSettings ?? AppearanceSettings();
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
        symbolAndNumberSeparator: wsm.symbolAndNumberSeparator);

    _formattedAmount = _Utility.getFormattedAmount(wsm.displayFormat, _fmf);

    // controller handler
    if (ws.controller == null) {
      ws.controller = TextEditingController();
      _useInternalController = true;
    }

    ws.controller.text = '${_fmf.amount}';
    ws.controller.addListener(_onChanged);

    // inputFormatter handler
    if (ws.inputFormatters == null)
      ws.inputFormatters = List<TextInputFormatter>();

    ws.inputFormatters.insertAll(0, <TextInputFormatter>[
      WhitelistingTextInputFormatter(RegExp('[\-0-9.]')),
      BlacklistingTextInputFormatter(RegExp('\s'))
    ]);
  }

  @override
  dispose() {
    super.dispose();

    if (_useInternalController) widget.settings.controller.dispose();
  }

  _onChanged() {
    MoneyTextFormFieldSettings ws = widget.settings;

    _fmf = _fmf.copyWith(
        amount: _Utility.stringToDouble(ws.controller.text,
            fractionDigits: ws.moneyFormatSettings.fractionDigits));

    _formattedAmount =
        _Utility.getFormattedAmount(ws.moneyFormatSettings.displayFormat, _fmf);

    if (widget.settings.onChanged != null) widget.settings.onChanged();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    MoneyTextFormFieldSettings ws = widget.settings;
    AppearanceSettings wsa = ws.appearanceSettings;

    return Padding(
      padding: wsa.padding,
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
            keyboardType:
                TextInputType.numberWithOptions(decimal: true, signed: true),
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
  static String getFormattedAmount(
      MoneyDisplayFormat displayFormat, FlutterMoneyFormatter fmf) {
    MoneyFormatterOutput _fo = fmf.output;
    switch (displayFormat) {
      case MoneyDisplayFormat.compactSymbolOnLeft:
        return _fo.compactSymbolOnLeft;
        break;
      case MoneyDisplayFormat.compactSymbolOnRight:
        return _fo.compactSymbolOnRight;
        break;
      case MoneyDisplayFormat.compactNonSymbol:
        return _fo.compactNonSymbol;
        break;
      case MoneyDisplayFormat.symbolOnLeft:
        return _fo.symbolOnLeft;
        break;
      case MoneyDisplayFormat.symbolOnRight:
        return _fo.symbolOnRight;
        break;
      default:
        return _fo.nonSymbol;
        break;
    }
  }
}
