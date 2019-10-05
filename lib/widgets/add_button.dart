import 'package:carros_flutter_web/colors.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final Function onPressed;

  AddButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        icon: Icon(
          Icons.add,
          color: AppColors.blue,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
