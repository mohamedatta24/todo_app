import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/core/errors/custom_exception.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/core/services/database_service.dart';
import 'package:todo_app/core/services/firebase_auth_service.dart';
import 'package:todo_app/core/widgets/backend_endpoints.dart';
import 'package:todo_app/features/auth/data/models/user_model.dart';
import 'package:todo_app/features/auth/domain/entities/user_entity.dart';
import 'package:todo_app/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.databaseService,
  });

  // create user with email and password--------------------------------------
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email,
        password,
      );
      final userEntity = UserEntity(id: user.uid, name: name, email: email);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUserData(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      await deleteUserData(user);
      return Left(ServerFailure('An unexpected error occurred.'));
    }
  }

  Future<void> deleteUserData(User? user) async {
    if (user != null) {
      await deleteAccount();
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
      final userEntity = await getUserData(uid: user.uid);
      return Right(userEntity);
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
      final userEntity = UserModel.fromUserFirebase(user);
      await addUserData(user: userEntity);
      return Right(userEntity);
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
      final userEntity = UserModel.fromUserFirebase(user);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('An unexpected error occurred.'));
    }
  }

  // add User Data--------------------------------------
  @override
  Future<void> addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoints.addUserData,
      data: user.toMap(),
      documentId: user.id,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    final data = await databaseService.getData(
      path: BackendEndpoints.getUserData,
      documentId: uid,
    );
    return UserModel.fromJson(data);
  }

  @override
  Future<void> deleteAccount() async {
    await firebaseAuthService.deleteData();
  }
}
