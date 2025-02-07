// ignore_for_file: use_build_context_synchronously
import 'package:ecommerceapp/Core/AppRoutes.dart';
import 'package:ecommerceapp/Core/AuthService.dart';
import 'package:ecommerceapp/Core/Button.dart';
import 'package:ecommerceapp/Core/CustomTextField.dart';
import 'package:ecommerceapp/Core/AppStyles.dart';
import 'package:ecommerceapp/Features/LogInView/Data/TextFieldModel.dart';
import 'package:ecommerceapp/Features/LogInView/Presentation/Views/Widgets/FooterWidget.dart';
import 'package:ecommerceapp/Features/LogInView/Presentation/Views/Widgets/SocialMedia.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  GlobalKey<FormState> formkey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool remberme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign In",
          style: AppStyles.text14(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: AutofillGroup(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: formkey,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome",
                        style: AppStyles.text20(context),
                      ),
                      Text(
                        "Sign in with your email and password\n or continue with social media",
                        style: AppStyles.text16(context),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        textFieldModel: TextFieldModel(
                          autofillHints: [AutofillHints.email],
                          controller: emailController,
                          hintText: "Enter your Email",
                          labelText: "Email",
                          iconData: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
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
                        key: const Key('password-field'),
                        textFieldModel: TextFieldModel(
                          autofillHints: [AutofillHints.password],
                          controller: passwordController,
                          hintText: "Enter your Password",
                          labelText: "Password",
                          iconData: Icons.remove_red_eye_outlined,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        valid: (value) {
                          if (value!.isEmpty || value.length < 6) {
                            return "Enter Password";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Row(
                          children: [
                            Checkbox(
                                value: remberme,
                                onChanged: (value) {
                                  setState(() {
                                    remberme = value!;
                                  });
                                }),
                            Text(
                              "Remember me",
                              style: AppStyles.text14(context),
                            ),
                            const Expanded(child: SizedBox()),
                            InkWell(
                              onTap: () {
                                GoRouter.of(context).push(
                                  AppRoutes.kForget,
                                  extra: emailController.text,
                                );
                              },
                              child: Text(
                                "Forgot Password",
                                style: AppStyles.text14(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      Button(
                        text: "Sign In",
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                            TextInput.finishAutofillContext();
                            try {
                              await AuthService().SignIn(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              emailController.clear();
                              passwordController.clear();
                              await QuickAlert.show(
                                context: context,
                                type: QuickAlertType.success,
                                onConfirmBtnTap: () {
                                  GoRouter.of(context).push(
                                    AppRoutes.kHome,
                                  );
                                },
                                showCancelBtn: true,
                                cancelBtnText: "Cancel",
                                onCancelBtnTap: () =>
                                    GoRouter.of(context).pop(),
                              );
                            } on FirebaseException catch (e) {
                              if (e.code == 'invalid-credential') {
                                await QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.error,
                                  text:
                                      "Invalid credentials, Please check your email and password.",
                                );
                              }
                            } catch (e) {
                              await QuickAlert.show(
                                context: context,
                                type: QuickAlertType.error,
                                text: e.toString(),
                              );
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialMedia(
                            image: "assets/Images/google.svg",
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SocialMedia(
                            image: "assets/Images/facebook.svg",
                          ),
                        ],
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      const FooterWidget(),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
