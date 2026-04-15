import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  // create user with email and password--------------------------------------
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  // login with email and password--------------------------------------
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  // sign in with google--------------------------------------
  Future<Either<Failure, UserEntity>> signInWithGoogle();

  // sign in with facebook--------------------------------------
  Future<Either<Failure, UserEntity>> signInWithFacebook();
}
