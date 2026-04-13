import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.backgroundColor,
    this.textColor,
  });

  final String text;
  final void Function()? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.textColor,
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(color: AppColors.textColor, width: 2.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: textColor ?? AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
