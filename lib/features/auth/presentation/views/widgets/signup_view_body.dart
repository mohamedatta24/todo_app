import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/core/theme/app_text_styles.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/already_have_an_account.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_password_field.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  TextEditingController nameController = TextEditingController();
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
              "Create Account",
              style: AppTextStyles.bold32.copyWith(color: AppColors.textColor),
            ),
            const SizedBox(height: 50.0),
            CustomTextFormField(
              controller: nameController,
              hintText: "Name",
              suffixIcon: const Icon(Icons.person),
            ),
            const SizedBox(height: 16.0),
            CustomTextFormField(
              controller: emailController,
              hintText: "Email",
              suffixIcon: const Icon(Icons.email),
            ),
            const SizedBox(height: 16.0),
            CustomPasswordField(controller: passwordController),
            const SizedBox(height: 32.0),
            CustomButton(
              text: "Create account",
              onTap: () {
                if (formKey.currentState!.validate()) {
                  context.read<SignupCubit>().createUserWithEmailAndPassword(
                    name: nameController.text,
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
            const SizedBox(height: 32.0),
            const AlreadyHaveAnAccount(),
          ],
        ),
      ),
    );
  }
}
