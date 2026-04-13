import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/theme/app_text_styles.dart';

void customSnackBar(
  BuildContext context, {
  Color backgroundColor = Colors.red,
  required String message,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        textAlign: TextAlign.center,
        message,
        style: AppTextStyles.medium16.copyWith(color: AppColors.textColor),
      ),
      backgroundColor: backgroundColor,
    ),
  );
}
