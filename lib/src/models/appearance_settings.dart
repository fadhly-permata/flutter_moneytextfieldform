import 'package:flutter/material.dart';

class AppearanceSettings {
  AppearanceSettings(
      {this.labelText = 'Amount',
      this.hintText,
      this.icon,
      this.labelStyle,
      this.inputStyle,
      this.formattedStyle,
      this.errorStyle});

  String labelText;
  String hintText;

  Widget icon;

  TextStyle labelStyle;
  TextStyle inputStyle;
  TextStyle formattedStyle;
  TextStyle errorStyle;

  AppearanceSettings copyWith(
          {String labelText,
          String hintText,
          Widget icon,
          TextStyle labelStyle,
          TextStyle inputStyle,
          TextStyle formattedStyle,
          TextStyle errorStyle}) =>
      AppearanceSettings()
        ..labelText = labelText ?? this.labelText
        ..hintText = hintText ?? this.hintText
        ..icon = icon ?? this.icon
        ..labelStyle = labelStyle ?? this.labelStyle
        ..inputStyle = inputStyle ?? this.inputStyle
        ..formattedStyle = formattedStyle ?? this.formattedStyle
        ..errorStyle = errorStyle ?? this.errorStyle;
}
