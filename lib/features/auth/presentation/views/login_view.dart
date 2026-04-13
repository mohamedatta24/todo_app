import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            color: AppColors.textColor,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, size: 32.0),
          ),
        ),
      ),
      body: SafeArea(child: const LoginViewBody()),
    );
  }
}
