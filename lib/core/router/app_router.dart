import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/router/app_router_name.dart';
import 'package:todo_app/core/services/dependency_injection.dart';
import 'package:todo_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:todo_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:todo_app/features/auth/presentation/views/login_view.dart';
import 'package:todo_app/features/auth/presentation/views/signup_view.dart';
import 'package:todo_app/features/auth/presentation/views/welcome_view.dart';
import 'package:todo_app/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:todo_app/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterName.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case AppRouterName.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());

      case AppRouterName.wlcome:
        return MaterialPageRoute(builder: (_) => const WelcomeView());

      case AppRouterName.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginView(),
          ),
        );

      case AppRouterName.signup:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupView(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
