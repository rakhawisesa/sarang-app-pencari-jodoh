import 'package:flutter/material.dart';
import 'package:sarang/src/common_widgets/banner_widget.dart';
import 'package:sarang/src/common_widgets/custom_button_widget.dart';
import 'package:sarang/src/common_widgets/custom_text_button_widget.dart';
import 'package:sarang/src/common_widgets/custom_text_field_widget.dart';
import 'package:sarang/src/features/authentication/presentation/sign_up_age_job_screen.dart';
import 'package:sarang/src/theme_manager/font_manager.dart';
import 'package:sarang/src/theme_manager/style_manager.dart';
import 'package:sarang/src/theme_manager/values_manager.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String routeName = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.clear();
    nameController.dispose();
    emailController.clear();
    emailController.dispose();
    passwordController.clear();
    passwordController.dispose();
    super.dispose();
  }

  String? validationInput() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return "Name or Email or Password can't be empty";
    }

    if (nameController.text.length < 4 ||
        emailController.text.length < 4 ||
        passwordController.text.length < 4) {
      return "Too short, minimum 4 characters";
    }

    if (!emailController.text.contains("@")) {
      return "Invalid email";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p50, horizontal: AppPadding.p24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const BannerWidget(),
              CustomTextFieldWidget(
                labelName: "Complete Name",
                hintText: "Write your name",
                controller: nameController,
              ),
              const SizedBox(
                height: AppSize.s14,
              ),
              CustomTextFieldWidget(
                labelName: "Email Address",
                hintText: "Write your mail address",
                controller: emailController,
              ),
              const SizedBox(
                height: AppSize.s14,
              ),
              CustomTextFieldWidget(
                labelName: "Password",
                hintText: "Write your security",
                controller: passwordController,
                isObscure: true,
              ),
              const SizedBox(
                height: AppSize.s30,
              ),
              CustomButtonWidget(
                title: "Get Started",
                onTap: () {
                  final message = validationInput();
                  if (message != null) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          message,
                          textAlign: TextAlign.center,
                          style: getWhiteTextStyle().copyWith(
                            fontWeight: FontWeightManager.semiBold,
                          ),
                        ),
                      ),
                    );
                    return;
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpAgeJobScreen(
                          fullname: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      ));
                },
              ),
              const SizedBox(
                height: AppSize.s40,
              ),
              CustomTextButtonWidget(
                title: "Sign in to my account",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
