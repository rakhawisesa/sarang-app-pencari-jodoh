import 'package:flutter/material.dart';
import 'package:sarang/src/theme_manager/color_manager.dart';
import 'package:sarang/src/theme_manager/style_manager.dart';
import 'package:sarang/src/theme_manager/values_manager.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.labelName,
    required this.hintText,
    required this.controller,
    this.isObscure = false,
  });

  final String labelName;
  final String hintText;
  final bool isObscure;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelName,
          style: getWhiteTextStyle(),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: controller,
          obscureText: isObscure,
          style: getWhiteTextStyle(),
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: getBlack30TextStyle(),
              contentPadding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p15, horizontal: AppPadding.p30),
              filled: true,
              fillColor: ColorManager.secondary,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.s50))),
        )
      ],
    );
  }
}
