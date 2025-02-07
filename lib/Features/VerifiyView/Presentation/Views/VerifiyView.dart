import 'package:ecommerceapp/Core/AppRoutes.dart';
import 'package:ecommerceapp/Core/AppStyles.dart';
import 'package:ecommerceapp/Core/Button.dart';
import 'package:ecommerceapp/Core/CustomSuccessWidget.dart';
import 'package:ecommerceapp/Core/TimeAnimation.dart';
import 'package:ecommerceapp/Features/VerifiyView/Presentation/Views/Widgets/CodeVerifiyContainer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerifiyView extends StatelessWidget {
  const VerifiyView({super.key});

  @override
  Widget build(BuildContext context) {
    var phone = GoRouterState.of(context).extra;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "OTP verification",
          style: AppStyles.text14(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "OTP verification",
            style: AppStyles.text20(context),
          ),
          Text(
            "We sent your code to $phone",
            style: AppStyles.text14(context),
          ),
          const TimeAnimation(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.15,
          ),
          const CodeVerifiyContainer(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.15,
          ),
          Button(
            text: "Verify",
            onPressed: () {
              CustomSuccessWidget(context, () {
                GoRouter.of(context).push(AppRoutes.kHome);
              });
            },
          ),
          const Expanded(child: SizedBox()),
          Text(
            "Resend OTP code",
            style: AppStyles.text14(context),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
