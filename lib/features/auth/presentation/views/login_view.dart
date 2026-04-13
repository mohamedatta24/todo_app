import 'package:flutter/material.dart';
import 'package:todo_app/core/widgets/app_bar.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/login_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(child: const LoginViewBodyBlocConsumer()),
    );
  }
}
