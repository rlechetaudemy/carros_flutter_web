import 'package:flutter/material.dart';

class OnTapContainer extends StatelessWidget {
  final Widget child;
  final Function onTap;

  OnTapContainer({@required this.child, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
      ),
    );
  }
}

class StackMaterialContainer extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final StackFit fit;

  StackMaterialContainer({this.child, this.onTap, this.fit = StackFit.loose});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: this.fit,
      children: <Widget>[
        child,
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
            ),
          ),
        )
      ],
    );
  }
}
