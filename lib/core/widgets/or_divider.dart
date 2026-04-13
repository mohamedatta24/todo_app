import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/theme/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: AppColors.grayColor, thickness: 1.0),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "OR",
            style: AppTextStyles.medium16.copyWith(color: AppColors.textColor),
          ),
        ),
        const Expanded(
          child: Divider(color: AppColors.grayColor, thickness: 1.0),
        ),
      ],
    );
  }
}
