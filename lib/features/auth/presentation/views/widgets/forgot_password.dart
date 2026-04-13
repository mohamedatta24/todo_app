import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/theme/app_text_styles.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Text(
            "Forgot password?",
            style: AppTextStyles.medium16.copyWith(color: AppColors.grayColor),
          ),
        ),
      ],
    );
  }
}
