import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:moneytextformfield/src/models/money_format_settings.dart';
import 'package:moneytextformfield/src/models/appearance_settings.dart';

class MoneyTextFormFieldSettings {
  MoneyTextFormFieldSettings(
      {this.controller,
      this.validator,
      this.inputFormatters,
      this.onChanged,
      this.moneyFormatSettings,
      this.appearanceSettings,
      this.enabled = true});

  TextEditingController controller;
  FormFieldValidator<String> validator;
  List<TextInputFormatter> inputFormatters;
  VoidCallback onChanged;
  MoneyFormatSettings moneyFormatSettings;
  AppearanceSettings appearanceSettings;

  bool enabled;

  MoneyTextFormFieldSettings copyWith(
          {TextEditingController controller,
          FormFieldValidator<String> validator,
          List<TextInputFormatter> inputFormatters,
          VoidCallback onChanged,
          MoneyFormatSettings moneyFormatSettings,
          AppearanceSettings appearanceSettings,
          bool enabled}) =>
      MoneyTextFormFieldSettings()
        ..controller = controller ?? this.controller
        ..validator = validator ?? this.validator
        ..inputFormatters = inputFormatters ?? this.inputFormatters
        ..onChanged = onChanged ?? this.onChanged
        ..moneyFormatSettings = moneyFormatSettings ?? this.moneyFormatSettings
        ..appearanceSettings = appearanceSettings ?? this.appearanceSettings
        ..enabled = enabled ?? this.enabled;
}
