
import 'package:flutter/material.dart';

class DebugWidgetSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Text(">> ${constraints.maxWidth.toInt()}/${constraints.maxHeight.toInt()} <<"),
        );
      },
    );
  }
}
