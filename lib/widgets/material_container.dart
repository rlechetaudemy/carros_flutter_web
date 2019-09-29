import 'package:flutter/material.dart';

class MaterialContainer extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final StackFit fit;

  MaterialContainer({this.child, this.onPressed, this.fit = StackFit.loose});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: this.fit,
      children: <Widget>[
        child,
        Positioned.fill(
          child: new Material(
            color: Colors.transparent,
            child: new InkWell(
              onTap: onPressed,
            ),
          ),
        )
      ],
    );
  }
}
