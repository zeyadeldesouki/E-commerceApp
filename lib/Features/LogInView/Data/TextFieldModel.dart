import 'package:flutter/material.dart';

class TextFieldModel {
  final String hintText, labelText;
  final IconData iconData;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Iterable<String>? autofillHints;

  TextFieldModel(
      {this.controller,
      this.autofillHints,
      this.keyboardType = TextInputType.name,
      required this.hintText,
      required this.labelText,
      required this.iconData,
      this.obscureText = false});
}
