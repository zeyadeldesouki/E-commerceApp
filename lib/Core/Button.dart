import 'package:ecommerceapp/Core/AppStyles.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.onPressed,
    required this.text,
  });
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orangeAccent,
          minimumSize: Size(MediaQuery.sizeOf(context).width * 0.8, 50),
          alignment: AlignmentDirectional.center),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppStyles.text14(context)
            .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
