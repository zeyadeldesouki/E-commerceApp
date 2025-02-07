import 'package:ecommerceapp/Core/AppStyles.dart';
import 'package:ecommerceapp/Features/LogInView/Data/TextFieldModel.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textFieldModel,
    this.valid,
  });
  final TextFieldModel textFieldModel;
  final String? Function(String?)? valid;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: textFieldModel.autofillHints,
      controller: textFieldModel.controller,
      keyboardType: textFieldModel.keyboardType,
      obscureText: textFieldModel.obscureText,
      validator: valid,
      decoration: InputDecoration(
        suffixIcon: Icon(textFieldModel.iconData),
        hintText: textFieldModel.hintText,
        hintStyle: AppStyles.text14(context),
        labelText: textFieldModel.labelText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
