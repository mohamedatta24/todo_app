import 'package:flutter/material.dart';
import 'package:todo_app/core/router/app_router_name.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/theme/app_text_styles.dart';
import 'package:todo_app/core/widgets/custom_button.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 100.0),
          Text(
            "Welcome to Todo",
            style: AppTextStyles.bold22.copyWith(
              fontSize: 32.0,
              color: AppColors.textColor,
            ),
          ),
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              textAlign: TextAlign.center,
              "Please login to your account or create new account to continue",
              style: AppTextStyles.medium16.copyWith(
                color: AppColors.grayColor,
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          Column(
            children: [
              CustomButton(
                text: "Login",
                onTap: () {
                  Navigator.pushNamed(context, AppRouterName.login);
                },
              ),
              const SizedBox(height: 16.0),
              CustomButton(
                text: "Create account",
                onTap: () {},
                backgroundColor: Colors.transparent,
                textColor: AppColors.textColor,
              ),
            ],
          ),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}
