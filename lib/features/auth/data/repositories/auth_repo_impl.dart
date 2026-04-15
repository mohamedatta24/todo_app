import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/custom_exception.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/core/services/firebase_auth_service.dart';
import 'package:todo_app/features/auth/data/models/user_model.dart';
import 'package:todo_app/features/auth/domain/entities/user_entity.dart';
import 'package:todo_app/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  // create user with email and password--------------------------------------
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseAuthService.createUserWithEmailAndPassword(
        email,
        password,
      );
      return Right(UserModel.fromUserFirebase(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('An unexpected error occurred.'));
    }
  }

  // login with email and password--------------------------------------
  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(
        email,
        password,
      );
      return Right(UserModel.fromUserFirebase(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('An unexpected error occurred.'));
    }
  }

  // sign in with google--------------------------------------
  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await firebaseAuthService.signInWithGoogle();
      return Right(UserModel.fromUserFirebase(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('An unexpected error occurred.'));
    }
  }

  // sign in with facebook--------------------------------------
  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      final user = await firebaseAuthService.signInWithFacebook();
      return Right(UserModel.fromUserFirebase(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('An unexpected error occurred.'));
    }
  }
}
