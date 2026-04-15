
class UserEntity {
  final String id;
  final String name;
  final String email;

  UserEntity({required this.id, required this.name, required this.email});

  Map<String, dynamic> toMap() {
    return {"name": name, "email": email, "id": id};
  }
}
