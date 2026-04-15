import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.name, required super.email});

  factory UserModel.fromUserFirebase(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      id: user.uid,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(name: json['name'], email: json['email'], id: json["id"]);
  }
}
