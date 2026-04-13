import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/services/dependency_injection.dart';
import 'package:todo_app/core/widgets/app_bar.dart';
import 'package:todo_app/features/auth/presentation/signup/signup_cubit.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignupCubit>(),
      child: Scaffold(
        appBar: buildAppBar(context),
        body: SafeArea(child: const SignupViewBodyBlocConsumer()),
      ),
    );
  }
}

