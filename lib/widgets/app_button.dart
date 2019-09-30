import 'package:carros_flutter_web/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool showProgress;
  final bool whiteMode;

  AppButton(this.text,
      {this.onPressed, this.showProgress = false, this.whiteMode = false});

  @override
  Widget build(BuildContext context) {
    Color color = AppColors.blue; // Theme.of(context).primaryColor;

    Color background = whiteMode ? Colors.white : color;

    Color textColor = whiteMode ? color : Colors.white;

    return Container(
      height: 42,
      child: RaisedButton(
        color: background,
        child: showProgress
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(textColor),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                ),
              ),
        onPressed: onPressed,
      ),
    );
  }
}
