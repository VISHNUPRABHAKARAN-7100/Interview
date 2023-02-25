import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:inteview/registration_page/model/registration_model.dart';
import 'package:inteview/utils/constant_colors.dart';
import 'package:inteview/widgets/logo/logo_widget.dart';
import 'package:inteview/widgets/textformfield/custom_text_form_field.dart';
import 'package:provider/provider.dart';

import '../controller/registration_provider.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final reEnterPasswordEditingController = TextEditingController();
  final registrationFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Variable for calculating the size of the device
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: registrationFormKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LogoWidget(
                      logoTextColor: ConstantColors.whiteColor,
                      logoBackgroundtColor: ConstantColors.greenColor,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const Text('Welcome to Lungo !!'),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    const Text('Register to Continue'),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    CustomTextFormField(
                      hintText: 'Name',
                      controller: nameEditingController,
                      textInputFormatter: [
                        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                        LengthLimitingTextInputFormatter(15)
                      ],
                      keyboardType: TextInputType.name,
                      validatorOnTap: () {
                        if (nameEditingController.text.isEmpty) {
                          return 'Name Required';
                        } else if (nameEditingController.text.length < 5) {
                          return 'Enter a valid Name';
                        }
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    CustomTextFormField(
                      hintText: 'Email',
                      controller: emailEditingController,
                      keyboardType: TextInputType.emailAddress,
                      validatorOnTap: () {
                        if (emailEditingController.text.isEmpty) {
                          return 'Email required';
                        } else if (emailEditingController.text.length < 7) {
                          return 'Enter a valid Email address';
                        }
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    CustomTextFormField(
                      hintText: 'Password',
                      controller: passwordEditingController,
                      suffixIcon: Icons.remove_red_eye,
                      validatorOnTap: () {
                        if (reEnterPasswordEditingController.text.isEmpty) {
                          return 'Password required';
                        } else if (reEnterPasswordEditingController
                                .text.length <
                            6) {
                          return 'Password required atleast 6 letters';
                        } else if (passwordEditingController.text !=
                            reEnterPasswordEditingController.text) {
                          return 'Password missmatch';
                        }
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    CustomTextFormField(
                      hintText: 'Re-type password',
                      suffixIcon: Icons.remove_red_eye,
                      controller: reEnterPasswordEditingController,
                      validatorOnTap: () {
                        if (reEnterPasswordEditingController.text.isEmpty) {
                          return 'Password required';
                        } else if (reEnterPasswordEditingController
                                .text.length <
                            6) {
                          return 'Password required atleast 6 letters';
                        } else if (passwordEditingController.text !=
                            reEnterPasswordEditingController.text) {
                          return 'Password missmatch';
                        }
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    SizedBox(
                      width: size.width,
                      height: size.height * 0.06,
                      child: ElevatedButton(
                        onPressed: () {
                          if (registrationFormKey.currentState!.validate()) {
                            Provider.of<RegistrationProvider>(context,
                                    listen: false)
                                .register(
                                    emailEditingController.text,
                                    nameEditingController.text,
                                    passwordEditingController.text,
                                    context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ConstantColors.greenColor),
                        child: const Text('Register'),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'You have an account? Click ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              color: ConstantColors.greenColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
