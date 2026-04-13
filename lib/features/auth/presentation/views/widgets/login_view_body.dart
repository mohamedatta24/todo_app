import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/theme/app_text_styles.dart';
import 'package:todo_app/core/utils/app_images.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/core/widgets/or_divider.dart';
import 'package:todo_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_password_field.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/dont_have_an_account.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/forgot_password.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/social_login_buttons.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            Text(
              "Login",
              style: AppTextStyles.bold32.copyWith(color: AppColors.textColor),
            ),
            const SizedBox(height: 50.0),
            CustomTextFormField(
              controller: emailController,
              hintText: "Email",
              suffixIcon: const Icon(Icons.email),
            ),
            const SizedBox(height: 16.0),
            CustomPasswordField(controller: passwordController),
            const SizedBox(height: 10.0),
            const ForgotPassword(),
            const SizedBox(height: 32.0),
            CustomButton(
              text: "Login",
              onTap: () {
                if (formKey.currentState!.validate()) {
                  context.read<LoginCubit>().loginWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
            const SizedBox(height: 16.0),
            const OrDivider(),
            const SizedBox(height: 16.0),
            SocialLoginButtons(
              text: "Login with Facebook",
              image: Assets.imagesSocialIconsFacebook,
              onTap: () {},
            ),
            const SizedBox(height: 16.0),
            SocialLoginButtons(
              text: "Login with Google",
              image: Assets.imagesSocialIconsGoogle,
              onTap: () {},
            ),
            const SizedBox(height: 16.0),
            SocialLoginButtons(
              text: "Login with Apple",
              image: Assets.imagesSocialIconsApple,
              onTap: () {},
            ),
            const SizedBox(height: 32.0),
            const DontHaveAnAccount(),
          ],
        ),
      ),
    );
  }
}
