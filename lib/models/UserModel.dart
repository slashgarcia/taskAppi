import 'dart:convert';

import 'ProjectModel.dart';
import 'TokenModel.dart';

DataModel userModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String userModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    this.user,
    this.projects,
    this.token,
  });

  UserModel user;
  List<Project> projects;
  Token token;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        user: UserModel.fromJson(json["user"]),
        projects: List<Project>.from(
            json["projects"].map((x) => Project.fromJson(x))),
        token: Token.fromJson(json["token"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
        "token": token.toJson(),
      };
}

class UserModel {
  UserModel({
    this.username,
    this.email,
    this.id,
  });

  String username;
  String email;
  int id;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"],
        email: json["email"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "id": id,
      };
}
