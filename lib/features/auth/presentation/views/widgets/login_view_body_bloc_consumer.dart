import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/widgets/custom_progress_indicator.dart';
import 'package:todo_app/core/widgets/custom_snack_bar.dart';
import 'package:todo_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          customSnackBar(
            context,
            message: 'Login successful',
            backgroundColor: Color(0xFF4CAF50),
          );
        } else if (state is LoginFailure) {
          customSnackBar(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const CustomProgressIndicator();
        }
        return LoginViewBody();
      },
    );
  }
}
