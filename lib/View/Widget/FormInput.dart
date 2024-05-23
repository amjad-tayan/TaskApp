import 'package:flutter/material.dart';

import '../../Model/Constant.dart';

class FormInput extends StatelessWidget {
  String? text;
  IconData? icon;
  TextInputType keyboardType;
  Key key;
  bool obscureText = false;
  Color? textcolor;
  Function(String) onChanged;

  FormInput(
      {required this.text,
      required this.icon,
      required this.keyboardType,
      required this.key,
      required this.textcolor,
      required this.onChanged,
        required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      keyboardType: keyboardType,
      style: TextStyle(color: textcolor),
      key: key,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
          icon: Icon(icon, color: secondary),
          label: Text(
            text!,
            style: const TextStyle(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xa5e9feff)))),
    );
  }
}
