import 'package:moneytextformfield/src/models/money_display_format.dart';


class MoneyFormatSettings {
  MoneyFormatSettings({
    this.amount = 0.0,
    this.fractionDigits = 2,
    this.currencySymbol = '\$',
    this.thousandSeparator = ',',
    this.decimalSeparator = '.',
    this.spaceBetweenSymbolAndNumber = true,
    this.displayFormat = MoneyDisplayFormat.longLeftSymbol
  });


  double amount;
  int fractionDigits;
  String currencySymbol;
  String thousandSeparator;
  String decimalSeparator;
  bool spaceBetweenSymbolAndNumber;
  MoneyDisplayFormat displayFormat;


  MoneyFormatSettings copyWith({
    double amount,
    int fractionDigits,
    String currencySymbol,
    String thousandSeparator,
    String decimalSeparator,
    bool spaceBetweenSymbolAndNumber,
    MoneyDisplayFormat displayFormat
  })
    => 
      MoneyFormatSettings()
        ..amount = amount ?? this.amount
        ..fractionDigits = fractionDigits ?? this.fractionDigits
        ..currencySymbol = currencySymbol ?? this.currencySymbol
        ..thousandSeparator = thousandSeparator ?? this.thousandSeparator
        ..decimalSeparator = decimalSeparator ?? this.decimalSeparator
        ..spaceBetweenSymbolAndNumber = spaceBetweenSymbolAndNumber ?? this.spaceBetweenSymbolAndNumber
        ..displayFormat = displayFormat ?? this.displayFormat;
}