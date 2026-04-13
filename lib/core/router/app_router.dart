import 'package:flutter/material.dart';
import 'package:todo_app/core/router/app_router_name.dart';
import 'package:todo_app/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:todo_app/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterName.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case AppRouterName.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
