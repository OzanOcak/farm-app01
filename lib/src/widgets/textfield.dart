import 'package:farmer/src/styles/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppTextField extends StatelessWidget {
  final bool isIOS;
  final String hintText;
  final IconData materialIcon;
  final IconData cupertinoIcon;
  final TextInputType textInputType;
  final bool obscureText;
  final String errorText;
  final void Function(String) onChanged;

  AppTextField(
      {@required this.isIOS,
      @required this.hintText,
      @required this.cupertinoIcon,
      @required this.materialIcon,
      this.textInputType = TextInputType.text,
      this.obscureText = false,
      this.errorText,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    if (isIOS) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: TextFieldStyles.textBoxHorizontal,
            vertical: TextFieldStyles.textBoxVertical),
        child: CupertinoTextField(
          keyboardType: textInputType,
          padding: EdgeInsets.all(12.0),
          placeholder: hintText,
          placeholderStyle: TextFieldStyles.placeholder,
          style: TextFieldStyles.text,
          textAlign: TextFieldStyles.textAlign,
          cursorColor: TextFieldStyles.cursorColor,
          decoration: TextFieldStyles.cupertinoDecoration,
          prefix: TextFieldStyles.iconPrefix(cupertinoIcon),
          obscureText: obscureText,
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: TextFieldStyles.textBoxHorizontal,
            vertical: TextFieldStyles.textBoxVertical),
        child: TextField(
          keyboardType: textInputType,
          cursorColor: TextFieldStyles.cursorColor,
          style: TextFieldStyles.text,
          textAlign: TextFieldStyles.textAlign,
          decoration: TextFieldStyles.materialDecoration(
              hintText, materialIcon, errorText),
          obscureText: obscureText,
          onChanged: onChanged,
        ),
      );
    }
  }
}
