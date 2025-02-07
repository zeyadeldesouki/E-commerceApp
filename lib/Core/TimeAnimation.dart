import 'package:ecommerceapp/Core/AppStyles.dart';
import 'package:flutter/material.dart';

class TimeAnimation extends StatelessWidget {
  const TimeAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 30.0, end: 0.0),
      duration: const Duration(seconds: 30),
      builder: (context, value, child) {
        return Text(
          "this code will expire in ${value.toInt()} Seconds",
          style: AppStyles.text14(context),
        );
      },
      onEnd: () {},
    );
  }
}
