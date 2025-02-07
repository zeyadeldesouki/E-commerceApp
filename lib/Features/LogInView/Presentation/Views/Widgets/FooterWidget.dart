import 'package:ecommerceapp/Core/AppRoutes.dart';
import 'package:ecommerceapp/Core/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: AppStyles.text14(context),
        ),
        InkWell(
          onTap: () {
            GoRouter.of(context).push(AppRoutes.kSignup);
          },
          child: Text(
            "Sign Up",
            style: AppStyles.text14(context),
          ),
        ),
      ],
    );
  }
}
