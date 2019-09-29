import 'package:carros_flutter_web/colors.dart';
import 'package:carros_flutter_web/widgets/required_label.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String label;
  bool required;
  String hint;
  double width;
  bool password;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode nextFocus;

  AppTextField({
    this.label,
    this.required = false,
    this.hint,
    this.width,
    this.password = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RequiredLabel(label, required),
//        SizedBox(
//          height: 6,
//        ),
        _textField(context),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  _textField(context) {
    return Container(
      width: width ?? double.maxFinite,
      child: TextFormField(
        //key: Key(label),
        controller: controller,
        obscureText: password,
        validator: validator,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        focusNode: focusNode,
        onFieldSubmitted: (String text) {
          if (nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          }
        },
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        decoration: InputDecoration(
//        border: OutlineInputBorder(
//          borderRadius: BorderRadius.circular(16)
//        ),
//          labelText: label,
          labelStyle: TextStyle(
            fontSize: 20,
            color: AppColors.blue,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
