import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
  });
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $hintText';
        }
        return null;
      },
      cursorColor: AppColors.grayColor,
      style: const TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        suffixIconColor: AppColors.grayColor,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.grayColor),
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(7.0),
      borderSide: BorderSide(color: AppColors.textColor, width: 1.5),
    );
  }
}
