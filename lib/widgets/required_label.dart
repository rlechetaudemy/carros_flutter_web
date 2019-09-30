import 'package:flutter/material.dart';

import 'app_text.dart';

class RequiredLabel extends StatelessWidget {
  String label;
  bool required;

  RequiredLabel(this.label, this.required);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AppText(
          label,
          bold: true,
//          color: AppColors.blue,
        ),
        required
            ? Row(
                children: <Widget>[
                  SizedBox(width: 6),
                  AppText("*", color: Colors.red),
                ],
              )
            : Container(),
      ],
    );
  }
}
