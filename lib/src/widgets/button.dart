import 'package:farmer/src/styles/base.dart';
import 'package:farmer/src/styles/button.dart';
import 'package:farmer/src/styles/color.dart';
import 'package:farmer/src/styles/text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  //to toggle the button, need stf

  final String buttonText;
  final ButtonType buttonType;
  final void Function() onPressed;

  AppButton({@required this.buttonText, this.buttonType, this.onPressed});

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    TextStyle fontStyle;
    Color buttonColor;

    switch (widget.buttonType) {
      case ButtonType.Straw:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.straw;
        break;
      case ButtonType.LightBlue:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.lightblue;
        break;
      case ButtonType.DarkBlue:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.darkblue;
        break;
      case ButtonType.Disabled:
        fontStyle = TextStyles.buttonTextDark;
        buttonColor = AppColors.lightgray;
        break;
      case ButtonType.DarkGray:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.darkgray;
        break;
      default:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.lightblue;
        break;
    }

    return AnimatedContainer(
      // to move button smoother
      padding: EdgeInsets.only(
        top: (pressed)
            ? BaseStyles.listFieldVertical + BaseStyles.animationOffset
            : BaseStyles.listFieldVertical,
        bottom: (pressed)
            ? BaseStyles.listFieldVertical - BaseStyles.animationOffset
            : BaseStyles.listFieldVertical,
        left: BaseStyles.listFieldVertical,
        right: BaseStyles.listFieldVertical,
      ),
      duration: Duration(milliseconds: 20),
      child: GestureDetector(
        child: Container(
          height: ButtonStyles.buttonHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
              boxShadow: BaseStyles.boxShadow),
          child: Center(child: Text(widget.buttonText, style: fontStyle)),
        ),
        onTapDown: (details) {
          setState(() {
            if (widget.buttonType != ButtonType.Disabled) pressed = !pressed;
          });
        },
        onTapUp: (details) {
          setState(() {
            if (widget.buttonType != ButtonType.Disabled) pressed = !pressed;
          });
        },
        onTap: () {
          if (widget.buttonType != ButtonType.Disabled) {
            widget.onPressed();
          }
        },
      ),
    );
  }
}

enum ButtonType { LightBlue, Straw, Disabled, DarkGray, DarkBlue }
