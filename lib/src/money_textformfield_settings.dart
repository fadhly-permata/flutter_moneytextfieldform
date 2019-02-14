import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:moneytextformfield/src/money_display_format.dart';

class MoneyTextFormFieldSettings {
  MoneyTextFormFieldSettings({
    @required this.amount,
    this.currencySymbol = '\$',
    this.displayFormat = MoneyDisplayFormat.longLeftSymbol,
    this.fractionDigits = 2,
    this.thousandSeparator = ',',
    this.decimalSeparator = '.',
    this.spaceBetweenSymbolAndNumber = true,
    
    this.labelText = 'Amount',
    this.labelStyle,
    this.formatStyle,
    this.inputStyle
  });

  TextEditingController controller;
  
  double amount;
  int fractionDigits;
  String currencySymbol;
  MoneyDisplayFormat displayFormat;
  String thousandSeparator;
  String decimalSeparator;
  bool spaceBetweenSymbolAndNumber;

  String formattedAmount;

  String labelText;
  TextStyle labelStyle;
  TextStyle formatStyle;
  TextStyle inputStyle;
}