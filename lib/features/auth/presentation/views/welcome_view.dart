import 'package:flutter/material.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/welcome_view_body.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const SafeArea(child: WelcomeViewBody()));
  }
}
