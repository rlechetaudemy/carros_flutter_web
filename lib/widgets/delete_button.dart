import 'package:carros_flutter_web/colors.dart';
import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  final Function onPressed;

  DeleteButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        icon: Icon(Icons.delete_forever, color: AppColors.blue),
        onPressed: onPressed,
      ),
    );
  }
}
