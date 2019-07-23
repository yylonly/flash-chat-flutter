import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {

  final String hintText;
  final Function onChanged;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController controller;

  ChatTextField({this.hintText, @required this.onChanged, this.isPassword = false, this.keyboardType = TextInputType.text, this.controller});

  @override
  Widget build(BuildContext context) {



    return TextField(
      keyboardType: keyboardType,
      obscureText: isPassword,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        contentPadding:
        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
