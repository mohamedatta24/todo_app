import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/router/app_router.dart';
import 'package:todo_app/core/router/app_router_name.dart';
import 'package:todo_app/core/services/custom_bloc_observer.dart';
import 'package:todo_app/core/services/dependency_injection.dart';
import 'package:todo_app/core/theme/app_colors.dart';
import 'package:todo_app/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:todo_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = CustomBlocObserver();
  setupGetIt();
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
      debugShowCheckedModeBanner: false,
      home: OnBoardingView(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRouterName.splash,
    );
  }
}
