# MoneyTextFormField

> `MoneyTextFormField` is one of the flutter widget packages that can be used to input values in the form of currencies, by displaying the output format in realtime.
>
> This widget is based on the `FlutterMoneyFormatter` package which has a very powerful ability to do currency formatting.
>
> [![latest version](https://img.shields.io/pub/v/moneytextformfield.svg?style=plastic&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAQAAAC1QeVaAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QA/4ePzL8AAAAHdElNRQfjAg8HMDMbfsHaAAABSUlEQVQY0y2LsUvUYRyHn+/7fe2uVMIz4hcnin+BFCrdZq1BQ1MN4VJxY7MoRLg7OGQ0NPkfiIOYBbYpiUO0VSQ15UFxHHf8fu/7cTif9XkeEz/54TO5qX4xtmJP8mZ8vR+vpt/q4gU3QitP3Iwr9fdhyerhPjZ7cBZH9Rf75ldSp11tXKsnZYHlEDvrt9dO4/dkjwjF6tde43M5GjGBlGoxrNtainGOsef9RqsMIyfUEZg8V1pVslf+crL3dup6EW6ZOMMRGEbmnmqh07bpkLEB89xhgMFQo8dRy4AZMGAe+EINkAEp2B6QhvHw7nOJ+9Fuq2guNsvKDaNiBvGLkUTQuf8Pd3e6U+MLKnGAkmkyf8xN/+zAeuFBKt+FZ6qGmux+tP3xw0TFGz7ZoffRlqQkSSolvRCK8Skmz9lpE3lIl0CiUfUix34BalOOAMgIffsAAAAldEVYdGRhdGU6Y3JlYXRlADIwMTktMDItMTVUMDc6NDg6NTEtMDU6MDCMNC56AAAAJXRFWHRkYXRlOm1vZGlmeQAyMDE5LTAyLTE1VDA3OjQ4OjUxLTA1OjAw/WmWxgAAAABJRU5ErkJggg==)](https://pub.dartlang.org/packages/flutter_money_formatter)
> [![last commit](https://img.shields.io/github/last-commit/fadhly-permata/flutter_moneytextfieldform.svg?logo=github)](https://github.com/fadhly-permata/flutter_money_formatter)
> [![License](https://img.shields.io/badge/license-MIT-blue.svg?style=plastic&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAMAAAAolt3jAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAACPVBMVEXLy9UAAADLy9Tn7ubo7+bh5+Lb397b397i6OLc4N/f4+Df5ODc4N/i5+Li5+Lk6ePj6ePf4uAAAFbo7ubn7uU5F3re4eDw9+ru9unk6uTu9unOztbLy9XQ0NfMzNXKydTLytXLytTKydPMzNXPz9fNzdbIyNPY29zZ3N3Z3N3Y29zb397b397Y29zZ3N3Z3N3Y29zIyNPNzdW/vM3Y29zc4N/c4N/c4N/c4N/c4N/c4N/c4N/c39/c4N/X29zAvM3b397c4N/b397b3t7b397b397b39/b397b3t7b39/c4N/b397b39/b397b39/a3t7c4N/c4N/a3t7b397b397b39/b39/b39/b39/b397b4N7b39/b397b39/b39/b397c4N/b397b397b397c4N/U19vb4N7b39/U1tvc4N/b397b397b397c4N/c4N/c4N/b397b4N7b39/b39/c4N/c4N/a3d7b397b397b397a3d7b4N7b39/a3d7b397b397b397a3d7T1NnU1trQ0dfb4N7b39/Q0dfU1trT1NnQ0dfT1NnR09jT1drT1drb4N7b39/T1trU1trR09jT1dnQ0NfNztbR0tjb397c4N/c4N/c4N/c4N/c4N/b39/NztbHx9LPz9fNzdXP0Nfb397b397b397b397b397b397b397b397FxNHJydTOztbPz9fMzNXNzdbOztbOztbLy9XLy9XNzdXMzNXPz9fc4N/c4N/c4N/c4N/c4N////9bn80kAAAAuXRSTlMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMEAQAAAQQDBAQRGBYQZ2cQFhgRBAQCC9T7+vr///r71AsCI+pwN0Hg4EE3cOsjlE+PBdbVBY5PlVxvZWfa2WdlcFvKXVFYwAjU0wjAWFFdy7D7sNfXsfuwC3u7gxDX1hCDu3sLAwAE1tUEAAMECAYGCNPSCAYGCAQDBqrv/f3x/MsEAwQEBmihl5OTmJ98AwQEAwQEAQAAAAMEAzPoO4QAAAABYktHRL6k3IPDAAAAB3RJTUUH4wIPByY17oXROAAAAN1JREFUCNcB0gAt/wAdHh8AIAEBAQEhAiIjJAAlJicoKSorLC0uLzAxMgAzNDU2Nzg5Ojs3PD0+PwADQEFCQ0RFRkdISUpLBAAFTE1OTwZQUQdSU1RVCABWVwlYWQpaWwtcXQxeXwBgYWJjZGVmZ2hpamtsbQBuuW+6cA1xcg5zu3S8dQB2d3h5eg97fBB9fn+AgQCCEYMShBOFhhSHFYgWiQCKi4yNjhePkBiRkpOUlQCWlxmYvZmam5ydnp+goQCioxqkpaanqKmqq6ytrgCvsLGyG7MBAbQctba3uPQxRmBOIi5hAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDE5LTAyLTE1VDA3OjM4OjUzLTA1OjAwMpAq0AAAACV0RVh0ZGF0ZTptb2RpZnkAMjAxOS0wMi0xNVQwNzozODo1My0wNTowMEPNkmwAAAAASUVORK5CYII=)](https://github.com/fadhly-permata/flutter_moneytextfieldform/blob/master/LICENSE)


#### Dependencies :
[![intl](https://img.shields.io/pub/vpre/flutter_money_formatter.svg?label=FlutterMoneyFormatter&colorA=gray&colorB=green&style=plastic)](https://pub.dartlang.org/packages/flutter_money_formatter)


---

## Install

For complete steps in installing `FlutterMoneyFormatter` you can see in the [**Installation Guide**](https://pub.dartlang.org/packages/moneytextformfield).


## Usage

Import the library in your dart file.

```dart
import 'package:moneytextformfield/moneytextformfield.dart';
```

Then put codes as in the following example:

```dart
TextEditingController mycontroller = TextEditingController();

...
... somelines of codes ...
...

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MoneyTextFormField Test'),
        ),
        body: Column(
          children: <Widget>[
            /// BEGIN OF MoneyTextFormField widget
            MoneyTextFormField(
              settings: MoneyTextFormFieldSettings(
                amount: 0.00,
                currencySymbol: '\$',
                decimalSeparator: '.',
                thousandSeparator: ',',
                fractionDigits: 2,
                spaceBetweenSymbolAndNumber: true,
                displayFormat: MoneyDisplayFormat.longLeftSymbol,

                labelText: 'Amount:',
                labelStyle: TextStyle(fontSize: 26.0),
                inputStyle: TextStyle(fontSize: 26.0),
                formatStyle: TextStyle(fontSize: 26.0, color: Colors.blue),

                controller: mycontroller
              )
            ),
            /// END OF MoneyTextFormField widget
          ],
        ),
      ),
    );
  }

...
... somelines of codes ...
...
```

From the above code it will look more or less like the following:

> ![MoneyTextFormField](doc\mtff-full-format.gif)
> Figure 1: Using full format



> ![MoneyTextFormField](doc\mtff-compact-format.gif)
> Figure 2: Using compact format

Referring to the example code above, to retrieve the value inputted by the user, you can get it through the `mycontroller.text` object as follows:

```dart
print(mycontroller.text)
```


## Configurations
For now, `MoneyTextFormField` only uses one property to configure the display of that object, the `settings` property that has a data type is an instance of `MoneyTextFormFieldSettings'. Following are the properties owned by the `MoneyTextFormFieldSettings` instance:

Name                            | Data Type     | Description
------------------------------- | ------------- | --------------------
`amount`                        | `double`                                  | Used to provide the initial value to be used by the widget. The default value is `0.0`.
`currencySymbol`                | `String`                                  | Used to replace the currency symbol that will be used. The default value is `'$'` (dollar sign).
`decimalSeparator`              | `String`                                  | Used to replace the separator character in fractions. The default value is `'.'` (dot).
`thousandSeparator`             | `String`                                  | Used to replace separating characters between thousands. The default value is `','` (comma).
`fractionDigits`                | `int`                                     | Used to set the number of fractional values to be displayed. The default value is `2'.
`spaceBetweenSymbolAndNumber`   | `bool`                                    | Used to ensure that currency symbols and values are separated by using space characters. The default value is `true`.
`displayFormat`                 | [MoneyDisplayFormat](#MoneyDisplayFormat) | Used to set the type of format that will be displayed on the widget. The default value is `MoneyDisplayFormat.longLeftSymbol`. For more details, [see here](#MoneyDisplayFormat).
`labelText`                     | `String`                                  | Use to replace the label that will be displayed on the widget. The default value is `'Amount'`.
`labelStyle`                    | `TextStyle`                               | Used to change `TextStyle` for` labelText`. The default value is `null`.
`inputStyle`                    | `TextStyle`                               | Used to change `TextStyle` in the input area. The default value is `null`.
`formatStyle`                   | `TextStyle`                               | Used to change `TextStyle` in the formatted area. The default value is `null`.
`controller`                    | `TextEditingController`                   | Used to capture values inputted by the user.

> ** Caution: ** No need to initialize the value in `controller.text`, because the value will be ignored. the `controller` property is only intended to capture the value inputted by the user.


### MoneyDisplayFormat

`MoneyDisplayFormat` is an enum object with values such as the following:
Name                | Description
------------------  | --------------------
longNoSymbol        | Used to display currency values in full format and without a currency symbol.
longLeftSymbol      | Used to display currency values in full format with currency symbols on the left.
longRightSymbol     | Used to display currency values in full format with currency symbols on the right.
compactNoSymbol     | Used to display currency values in a short format and without a currency symbol.
compactLeftSymbol   | Used to display currency values in a short format with a currency symbol on the left.
compactRightSymbol  | Used to display currency values in a short format with a currency symbol on the right.

---

## Demo

For more complete samples, you can grab it from the [example directory](https://github.com/fadhly-permata/flutter_moneytextfieldform/tree/master/example).

## Help Me

If you find an issue, bug, question, or want to request a new feature you can [do it here](https://github.com/fadhly-permata/flutter_moneytextfieldform/issues). You can also help me to improve features or fix some issues by [forking this project via Github](https://github.com/fadhly-permata/flutter_moneytextfieldform)

## ChangeLog

Are you curious about the changes that occur in each version? [See here for detailed informations](https://pub.dartlang.org/packages/moneytextformfield#-changelog-tab-).