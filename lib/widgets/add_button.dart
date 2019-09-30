import 'package:carros_flutter_web/colors.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  String text;
  Function onPressed;

  AddButton(this.text, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.white;

    const List<Color> colors = <Color>[
      AppColors.blue,
      Colors.blue,
    ];

    const radius = 20.0;

//    return Container(
//      width: 100,
//      height: 50.0,
//      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: LinearGradient(colors: colors), boxShadow: [
//        BoxShadow(
//          color: Colors.grey[500],
//          offset: Offset(0.0, 1.5),
//          blurRadius: 1.5,
//        ),
//      ]),
//      child: MaterialContainer(
//        child: Center(
//          child: Text(
//            text,
//            style: TextStyle(fontSize: 16,color: textColor),
//          ),
//        ),
//        onPressed: onPressed,
//      ),
//    );

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
