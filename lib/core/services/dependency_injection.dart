import 'package:get_it/get_it.dart';
import 'package:todo_app/core/services/firebase_auth_service.dart';
import 'package:todo_app/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:todo_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:todo_app/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:todo_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(firebaseAuthService: getIt<FirebaseAuthService>()),
  );
  getIt.registerSingleton<AuthRepo>(getIt<AuthRepoImpl>());
  getIt.registerSingleton<SignupCubit>(SignupCubit(getIt<AuthRepo>()));
  getIt.registerSingleton<LoginCubit>(LoginCubit(getIt<AuthRepo>()));
}
