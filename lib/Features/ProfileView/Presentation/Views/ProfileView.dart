import 'package:ecommerceapp/Core/AppRoutes.dart';
import 'package:ecommerceapp/Core/AppStyles.dart';
import 'package:ecommerceapp/Core/Button.dart';
import 'package:ecommerceapp/Core/CustomErrorWidget.dart';
import 'package:ecommerceapp/Core/CustomSuccessWidget.dart';
import 'package:ecommerceapp/Core/CustomTextField.dart';
import 'package:ecommerceapp/Features/LogInView/Data/TextFieldModel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final GlobalKey<FormState> formkey = GlobalKey();

  final TextEditingController Firstnamecontroller = TextEditingController();
  final TextEditingController Lastnamecontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController Addresscontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    Firstnamecontroller.dispose();
    Lastnamecontroller.dispose();
    phonecontroller.dispose();
    Addresscontroller.dispose();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
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
                      "Complete Profile",
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
                        controller: Firstnamecontroller,
                        hintText: "Enter your first name",
                        labelText: "First Name",
                        iconData: Icons.person,
                      ),
                      valid: (value) {
                        if (value!.isEmpty) {
                          return "Enter your first name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.02,
                    ),
                    CustomTextField(
                      textFieldModel: TextFieldModel(
                        controller: Lastnamecontroller,
                        hintText: "Enter your last name",
                        labelText: "Last Name",
                        iconData: Icons.person,
                      ),
                      valid: (value) {
                        if (value!.isEmpty) {
                          return "Enter your last name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.02,
                    ),
                    CustomTextField(
                      textFieldModel: TextFieldModel(
                        controller: phonecontroller,
                        hintText: "Enter your phone number",
                        labelText: "Phone Number",
                        iconData: Icons.phone,
                        keyboardType: TextInputType.phone,
                      ),
                      valid: (value) {
                        if (value!.isEmpty || value.length != 11) {
                          return "Enter a valid phone number";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.02,
                    ),
                    CustomTextField(
                      textFieldModel: TextFieldModel(
                        controller: Addresscontroller,
                        hintText: "Enter your address",
                        labelText: "Address",
                        iconData: Icons.location_on,
                      ),
                      valid: (value) {
                        if (value!.isEmpty) {
                          return "Enter your address";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                    ),
                    Button(
                      text: "Continue",
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          String phone = phonecontroller.text;
                          CustomSuccessWidget(
                            context,
                            () {
                              GoRouter.of(context).push(
                                AppRoutes.kVerifiy,
                                extra: phone,
                              );
                            },
                          );
                          Firstnamecontroller.clear();
                          Lastnamecontroller.clear();
                          phonecontroller.clear();
                          Addresscontroller.clear();
                        } else {
                          CustomErrorWidget(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
