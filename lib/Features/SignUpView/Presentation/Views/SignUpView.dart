// ignore_for_file: use_build_context_synchronously
import 'package:ecommerceapp/Core/AppRoutes.dart';
import 'package:ecommerceapp/Core/AppStyles.dart';
import 'package:ecommerceapp/Core/AuthService.dart';
import 'package:ecommerceapp/Core/Button.dart';
import 'package:ecommerceapp/Core/CustomTextField.dart';
import 'package:ecommerceapp/Features/LogInView/Data/TextFieldModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> formkey = GlobalKey();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign Up",
          style: AppStyles.text14(context),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Register Account",
                      style: AppStyles.text20(context),
                    ),
                    Text(
                      "Complete your details or continue",
                      style: AppStyles.text14(context),
                    ),
                    Text(
                      "with social media",
                      style: AppStyles.text14(context),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      textFieldModel: TextFieldModel(
                        controller: emailController,
                        hintText: "Enter your Email",
                        labelText: "Email",
                        iconData: Icons.email_outlined,
                      ),
                      valid: (value) {
                        if (value!.isEmpty || !value.contains("@gmail.com")) {
                          return "Enter correct email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.02,
                    ),
                    CustomTextField(
                      textFieldModel: TextFieldModel(
                        controller: passwordController,
                        hintText: "Enter your Password",
                        labelText: "Password",
                        iconData: Icons.remove_red_eye_outlined,
                        obscureText: true,
                      ),
                      valid: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return "Enter Password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.02,
                    ),
                    CustomTextField(
                      textFieldModel: TextFieldModel(
                        controller: confirmController,
                        hintText: "Confirm your Password",
                        labelText: "Confirm",
                        iconData: Icons.remove_red_eye_outlined,
                        obscureText: true,
                      ),
                      valid: (value) {
                        if (value!.isEmpty ||
                            value.length < 6 ||
                            value != passwordController.text) {
                          return "Enter Password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                    ),
                    Button(
                      text: "Sign Up",
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          try {
                            await AuthService().SignUp(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim());
                            emailController.clear();
                            passwordController.clear();
                            confirmController.clear();
                            await QuickAlert.show(
                              type: QuickAlertType.success,
                              context: context,
                              onConfirmBtnTap: () {
                                GoRouter.of(context).push(
                                  AppRoutes.kProfile,
                                );
                              },
                              showCancelBtn: true,
                              cancelBtnText: "Cancel",
                              onCancelBtnTap: () => GoRouter.of(context).pop(),
                            );
                          } on FirebaseException catch (e) {
                            if (e.code == 'weak-password') {
                              await QuickAlert.show(
                                type: QuickAlertType.warning,
                                text: "The password provided is too weak.",
                                context: context,
                              );
                            } else if (e.code == 'email-already-in-use') {
                              await QuickAlert.show(
                                type: QuickAlertType.error,
                                text:
                                    "The account already exists for that email.",
                                context: context,
                              );
                            }
                          } catch (e) {
                            await QuickAlert.show(
                              type: QuickAlertType.error,
                              text: e.toString(),
                              context: context,
                            );
                          }
                        }
                      },
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Text(
                      "By continuing, you confirm that you agree",
                      style: AppStyles.text14(context),
                    ),
                    Text(
                      "with our Terms and Conditions",
                      style: AppStyles.text14(context),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
