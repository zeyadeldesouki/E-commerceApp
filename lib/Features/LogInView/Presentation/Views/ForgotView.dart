// ignore_for_file: use_build_context_synchronously

import 'package:ecommerceapp/Core/AppRoutes.dart';
import 'package:ecommerceapp/Core/AppStyles.dart';
import 'package:ecommerceapp/Core/AuthService.dart';
import 'package:ecommerceapp/Core/Button.dart';
import 'package:ecommerceapp/Core/CustomErrorWidget.dart';
import 'package:ecommerceapp/Core/CustomSuccessWidget.dart';
import 'package:ecommerceapp/Core/CustomTextField.dart';
import 'package:ecommerceapp/Features/LogInView/Data/TextFieldModel.dart';
import 'package:ecommerceapp/Features/LogInView/Presentation/Views/Widgets/FooterWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotView extends StatefulWidget {
  const ForgotView({super.key});

  @override
  State<ForgotView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {
  final GlobalKey<FormState> formkey = GlobalKey();

  final TextEditingController emailcontroller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Forgot Password",
          style: AppStyles.text14(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formkey,
          child: Column(
            children: [
              Text(
                "Forgot Password",
                style: AppStyles.text20(context),
              ),
              Text(
                "Please enter your email address to\n receive a link to reset your password",
                style: AppStyles.text14(context),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              CustomTextField(
                textFieldModel: TextFieldModel(
                  controller: emailcontroller,
                  hintText: "Enter your Email",
                  labelText: "Email",
                  iconData: Icons.email_outlined,
                ),
                valid: (value) {
                  if (value!.isEmpty || !value.contains("@gmail.com")) {
                    return "Please enter your email address correctly";
                  }
                  return null;
                },
              ),
              const Expanded(child: SizedBox()),
              Button(
                text: "Reset Password",
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    await AuthService().SetPassword(
                      email: emailcontroller.text,
                    );
                    CustomSuccessWidget(
                      context,
                      () {
                        GoRouter.of(context).push(AppRoutes.kLogin);
                      },
                    );
                    emailcontroller.clear();
                  } else {
                    CustomErrorWidget(context);
                  }
                },
              ),
              const Expanded(child: SizedBox()),
              const FooterWidget(),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
