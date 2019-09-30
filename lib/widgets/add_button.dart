import 'package:carros_flutter_web/colors.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  Function onPressed;

  AddButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        icon: Icon(Icons.add, color: AppColors.blue,),
        onPressed: onPressed,
      ),
    );
  }
}


class AddButton2 extends StatelessWidget {
  String text;
  Function onPressed;

  AddButton2(this.text, {@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.white;

    const List<Color> colors = <Color>[
      AppColors.blue,
      Colors.blue,
    ];

    const radius = 20.0;

    return RaisedButton(
      textColor: textColor,
      padding: const EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
