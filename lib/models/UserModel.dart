import 'dart:convert';

UserModel projectModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String projectModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.username,
    this.email,
  });

  int id;
  String username;
  String email;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
      };
}
