import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/theme/app_text_styles.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/already_have_an_account.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_password_field.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Text(
            "Create Account",
            style: AppTextStyles.bold32.copyWith(color: AppColors.textColor),
          ),
          const SizedBox(height: 50.0),
          CustomTextFormField(
            hintText: "Name",
            suffixIcon: const Icon(Icons.person),
          ),
          const SizedBox(height: 16.0),
          CustomTextFormField(
            hintText: "Email",
            suffixIcon: const Icon(Icons.email),
          ),
          const SizedBox(height: 16.0),
          const CustomPasswordField(),
          const SizedBox(height: 32.0),
          CustomButton(text: "Create account", onTap: () {}),
          const SizedBox(height: 32.0),
          const AlreadyHaveAnAccount(),
        ],
      ),
    );
  }
}
